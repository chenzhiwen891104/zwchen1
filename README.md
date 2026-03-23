# zwchen1

一、terraform创建一个k8s集群
1、进入terraform-huaweicloud-cce目录 执行terraform init	初始化工作目录，下载 Provider
2、执行 terraform plan	预览即将创建的资源
3、terraform apply 创建k8s资源

二、jenkins实现服务蓝绿发布
1、k8s基本架构准备：
   创建命名空间blue，执行bluegreendeployment/blue目录下相关yaml文件
   创建命名空间green,执行bluegreendeployment/green目录下相关yaml文件
2、部署一组nginx网关服务，并应用nginx.conf
3、jenkins创建freestyle任务，选择参数化构建，新增namespace参数，value可选blue/green
4、构建脚本中运用sed 命令修改my-deploy.yaml文件中k8s 镜像包的tag
5、构建脚本执行kubectl -n $namespace apply -f my-deploy.yaml
6、nginx应用网关修改nginx.conf location 中proxy_set_header
7、reload nginx 实现蓝绿流量切换。
