Root 后台流程：

**必须传入的参数**: `product,vendor,build_version,build_date,ro_utc_date,android_version,category,keyword,sdk_version`
`category` 是一个 root 方案的最重要的识别标志，不同类型返回不同的 root 方案以及辅助方案，一下是类型的具体说明，以及每个类型的逻辑：
所有下发的 root方案必须满足以下两个前题：
1.方案必须是启用状态的（status=true）。
2.方案是根据客户端的版本号区分 pie 和非 pie 的。
   目前分两个。小于21和大于等于21

类型映射表：
```
CATEGORIES = {"辅助工具" => -1,"精确匹配" => 0,'通用匹配' =>1,
                'RO-通用匹配' => 2 , 'RO-精准匹配' => 3, '扩展方案1' => 4 }
  PIES = {'非PIE 方案' => 20,'PIE方案' => 21}
```

_Note:辅助工具不参与计算，只是一种辅助方案_

####精确匹配（category=0）
精确匹配回去机型表（phones）去根据具体的参数查找对应机型（product,vendor,build_version,build_date），并且按照每个机型的适配个数从大到小进行排序。如果查询到了对应机型的 root 方案，再查找所有非精准匹配方案的，即 category > 0的。如果方案里面都是精准匹配（没有 category>0的）那么返回keyword = "general_tools"的方案作为工具方案和 root 方案一起下发。如果没找到。那么就把 shua_su（keyword = "ro_tools"） 作为辅助工具和 root 方案进行下发。

####通用匹配(category=1)
通用匹配查询的是 category=1的所有方案，同时和general_tools 一起下发

####Ro通用匹配(category=2)
查询所有category 为2的 root 方案，并且同时下发 shua_su(keyword = "ro_tools"） 的助工具

####Ro 精准（category=3）
如果关键字存在，那么返回的精确匹配的算法
如果精确匹配失败 则走 Ro 精确匹配，即：查询所有 category =3 并且 keyword 是所传的值的所有方案，这些方案在下发的时候带上shua_su（keyword = "ro_tools"）作为辅助方案

####扩展方案一
只查询所有类型是4的 root 方案。直接下发。

如果没有匹配以上4中逻辑。那么直接返回空。如果上述四中逻辑都没有对应的方案，那么也返回空。