#scratch 是docker中内置的最基础镜像，
#不能 pull, 不能run , 不能tag
#但是可以引用 scratch
FROM scratch
FROM node:12.18.1 as base
ADD ./ /
CMD ["node","./index.js"]