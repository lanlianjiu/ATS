# ATS
Maven
Maven Download URL: https://maven.apache.org/download.cgi
1. 下载并解压Maven；
2. 将环境变量M2_HOME设置为解压后的目录；
3. 将M2环境变量设置为M2_HOME/bin（在Windows上是%M2_HOME%/bin，在Unix上是$M2_HOME/bin）；
Maven安装目录中：%M2_HOME%/conf/settings.xml
用户主目录中：${user.home}/.m2/settings.xml
两个配置文件都是可选的。如果两个文件都存在，则用户目录下的配置会覆盖Maven安装目录中的配置。
mvn -version/-v 显示版本信息
mvn archetype:generate 创建mvn项目
mvn archetype:create -DgroupId=com.oreilly -DartifactId=my-app 创建mvn项目
mvn package 生成target目录，编译、测试代码，生成测试报告，生成jar/war文件
mvn jetty:run 运行项目于jetty上,
mvn compile 编译
mvn test 编译并测试
mvn clean 清空生成的文件
mvn site 生成项目相关信息的网站


什么是npm？
npm是随同NodeJS一起安装的包管理工具，能解决NodeJS代码部署上的很多问题，常见的使用场景有以下几种：
允许用户从npm服务器下载别人编写的第三方包到本地使用。
允许用户从npm服务器下载并安装别人编写的命令行程序到本地使用。
允许用户将自己编写的包或命令行程序上传到npm服务器供别人使用。


环境安装：
Nodejs
Nodejs Download URL: http://nodejs.cn/download/

npm如何换源？
淘宝npm镜像 源地址：http://registry.npm.taobao.org/
临时使用 npm --registry https://registry.npm.taobao.org install express
持久使用 npm config set registry https://registry.npm.taobao.org

Git
Git Download URL: https://git-for-windows.github.io/
TortoiseGit Download URL: https://tortoisegit.org/download/

全局插件：（所有项目只需要安装一次）

1、npm install -g gulp 
2、npm install -g bower

安装方法：
1、npm install
2、bower install

使用方法：
开起web服务器：cd src/main; gulp dev 
开起CRUD刷新服务：cd env; gulp dev
生成war包：gulp mvndev（测试）gulp mvnonline（生产）

以上命令也可在VSCode中的 任务菜单 -> 运行任务 使用

目录结构：
./
.settings myeclipse配置文件夹
.vscode VSCode配置文件夹
conf 项目配置
env 项目环境配置
iov.config.js 项目配置文件
iov.manifest.json 项目依赖清单
env CRUD
iovRepertory 项目依赖仓库
src 前端文件
target Maven临时文件夹
