# 项目名称
CircleYes!

# 项目简介
jsp+servlet实现的个人博客系统，预计实现的功能有：登录、分类、发布文章、修改文章、评论回复等。

# 测试地址
http://121.196.169.53:5552/

# 目录

    jsp-blog  应用部署目录
	├─.idea                           
    ├─out                             
	│  ├─artifacts                   
	│  │  └─...
    ├─src                   
    │  ├─com                 
    │  │  ├─dao                       
    │  │  │  ├─ArticleDao.java       
    │  │  │  ├─CategoryDao.java      
    │  │  │  └─UserDao.java       
    │  │  ├─filter           
    │  │  │  └─AdminFilter.java          
    │  │  ├─model        
    │  │  │  ├─Article.java
	│  │  │  ├─Category.java
	│  │  │  ├─MainCategory.java
	│  │  │  ├─Pager.java
	│  │  │  ├─SubCategory.java
	│  │  │  └─User.java
    │  │  ├─service
	│  │  │  ├─ArticleService.java
	│  │  │  ├─CategoryService.java
	│  │  │  └─UserService.java
    │  │  ├─servlet
	│  │  │  ├─CategoryEditServlet.java
	│  │  │  ├─CategoryServlet.java
	│  │  │  ├─ImgServlet.java
	│  │  │  ├─LoginServlet.java
	│  │  │  ├─PosteditServlet.java
	│  │  │  └─PostlistServlet.java  
    │  │  ├─test
    │  │  │  └─Test.java
    │  │  ├─util
	│  │  │  └─JdbcUtil.java
    │  ├─blog.sql
    │  ├─jdbc.properties
    ├─web
    │  ├─admin
	│  │  └─...
	│  ├─css
	│  │  └─...
	│  ├─fonts
	│  │  └─...
	│  ├─img
	│  │  └─...
	│  ├─js
	│  │  └─...
	│  ├─META-INF
	│  │  └─...
	│  ├─WEB-INF
	│  │  ├─web.xml
	│  │  └─...
	│  ├─about.html
	│  ├─article.html
	│  ├─blog.jsp
	│  ├─bbs.jsp
	│  ├─contact.html
	│  ├─error.jsp
	│  ├─index.html
	│  ├─login.html
	│  ├─project.jsp
	│  ├─success.jsp
	├─MySite.iml
	└─README.md

# 设计思路
本项目采用了MVC+DAO设计模式。通过此模式，可以使项目在设计过程中结构更为明晰，并且能够方便的进行修改。MVC是一个分层模型，即模型、视图、控制器。DAO是一个数据库访问模型，隔离数据库操作。

# 功能实现

## 一、登录
login.html -> LoginServlet.java -> UserService.java -> UserDao.java

prepareStatement会自动对用户传入的单引号作转义，所以不需要对sql注入进行过滤。

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211114161804.png)

匹配到结果就返回true。
验证码从ImgServlet获取：

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211114162355.png)

随机数字并生成图片，同时把验证码写进session。

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211114162514.png)

如果用户名密码正确，且验证码与session内的相符，就进入后台。

## 二、分类
文章的分类对后期的管理帮助很大，所以添加了对分类的设置。

/servlet/CategoryServlet?action=getall
获取所有分类，然后转发到category.jsp

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211117233353.png)

使用JSTL <c:fotEach>标签获取mainCategory数组并输出。

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211117233640.png)

### 添加分类
/servlet/CategoryEditServlet?action=add
如果设置了父类，那就是二级分类，如果没有，那就添加一个新的主类。

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211117235639.png)

### 修改分类

使用Bootstrap调用modal模态框

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211118002522.png)


### 删除分类

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211118000127.png)

## 三、文章

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211116153006.png)

文本编辑选用了国内开源的Editor.md
https://pandao.github.io/editor.md/

### 发布文章

首先传到PosteditServlet进行处理

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211116164506.png)

调用Article模型且设置参数。

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211116164928.png)

如果是添加文件操作，调用ArticleDao把文章信息插入数据库

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211116165123.png)

### 列出文章
调用PostlistServlet查询文章。

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211117003615.png)

role为1。

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211117003018.png)

分类目前为空，所以这里采用了left join。
查询出所有文章后根据时间排序。

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211117003312.png)

### 修改文章

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211118153013.png)

后台接收result返回的值，加载各项标题、内容等。

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211118162650.png)


### 删除文章

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211118162936.png)

## 四、评论

### 发表评论

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211202230202.png)

CommentServlet对空值、长度、和xss攻击进行处理

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211202230247.png)

不仅设置了http-only，还过滤了可进行xss攻击的相关符号，可以防止钓取管理员cookie。

### 显示评论

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211202231335.png)

循环输出即可。

# 学习链接
getRequestDispatcher()与sendRedirect()的区别：https://blog.csdn.net/bestone0213/article/details/47614617

MVC的dao层、service层和controller层：https://blog.csdn.net/qq_26411021/article/details/79493340

properties配置文件：https://www.cnblogs.com/aeolian/p/properties.html

left join、right join和join的区别：
https://blog.csdn.net/Li_Jian_Hui_/article/details/105801454

data-toggle与data-target
https://blog.csdn.net/d295968572/article/details/56667863

中文变问号的解决方案
https://blog.csdn.net/hdp134793/article/details/84033915
https://blog.csdn.net/weixin_30737363/article/details/99572940

# 杂项
1、$(function(){ } 文档载入完毕就执行。
2、List指的是集合.<>是泛型,里面指定了这个集合中存放的是什么数据。
如：

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211114220534.png)

3、ajax() 方法用于执行 AJAX（异步 HTTP）请求。

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211114223529.png)

3、Map

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211114224246.png)

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211114224302.png)

4、Gson提供了fromJson() 和toJson() 两个直接用于解析和生成的方法，前者实现反序列化，后者实现了序列化。

5、Integer.parseInt将字符串转化为数值

6、SimpleDateFormat

![](https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/20211120001711.png)

String time = df.format(System.currentTimeMillis());也可。

7、Ajax请求中的async:false/true的作用
