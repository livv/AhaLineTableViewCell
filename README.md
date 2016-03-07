## AhaLineTableViewCell

UITableView 自带的分隔线总是很难满足需求。所以设置成`UITableViewCellSeparatorStyleNone`，然后自定义分隔线。

* 自定义颜色、高度、是否隐藏、左右间距。
* line的显示和间距都是自动完成的。

#### Use
Podfile

```
platform :ios, '7.0'
pod "AhaLineTableViewCell", "~> 1.0.0"
```

只需简单一行代码：

```
[tableView configLineforCell:cell forRowAtIndexPath:indexPath withLeftSpace:20];
```

#### Demo

   ![](demo.gif了)
   

