#引入 nodejs 基础镜像（构建出的新镜像继承了此基础镜像，第一阶段）
FROM node:12.18.1 as base

#指定工作目录（base工作目录， 剩下的可以写相对目录）
WORKDIR /app

#将package.json 引入镜像
COPY ["package.json", "package-lock.json*", "./"]




#在基础镜像上 生产单元测试镜像(第二阶段)
FROM base as test
RUN npm install
#拷贝项目代码 到镜像内
COPY . .

#构建镜像时，如果单元测试没有通过， 会导致构建镜像失败
RUN npm run test
#CMD [ "npm", "run", "test" ]



#在基础镜像上 生成生产镜像(第3阶段)
FROM base as prod
#指定环境变量 development or production
ENV NODE_ENV=production
#加载依赖（build 镜像时触发）
RUN npm install --production
COPY . .
#启动程序（当 docker run 时 运行）
CMD [ "node", "server.js" ]