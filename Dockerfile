# 使用官方 Node.js 镜像 (推荐使用 Node 18 LTS)
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 复制package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖（production模式如果只跑生产环境可使用 --production）
RUN npm install

# 复制项目文件
COPY . .

# 构建生产版本
RUN npm run build

# 对外暴露端口（默认Next.js 是3000）
EXPOSE 3000

# 启动应用（生产模式）
CMD [ "npm", "run", "start" ]