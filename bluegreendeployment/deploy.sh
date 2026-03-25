project='zwchen-deploy'
imageID=`date +%Y%m%d-%H%M`
imagename="harbor.zwchen.com/zwchen/resource-management-sbo:${imageID}"
cd /data/apps/$project
rm -rf *.jar
mv /data/jenkins-workspace/workspace/$project/$project/target/$project*.jar  ./
sudo docker build -t $imagename .
sudo docker push $imagename
sed -i "s#image: .*#image: ${imagename}#g" ../yaml/$project.yaml
kubectl -n $namespace apply -f ../yaml/$project/$namespace.yaml