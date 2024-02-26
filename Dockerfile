FROM node:21-alpine as base
# Put any tool installs here
RUN apk add --no-cache vim 

FROM base as builder
WORKDIR /home/node/app

COPY package*.json ./
RUN chown -R node:node package.json

RUN npm ci
COPY  --chown=node:node . .
RUN npm run build

FROM base as production
ENV NODE_ENV=production

WORKDIR /home/node/app

COPY --from=builder /home/node/app/dist ./dist
COPY --from=builder /home/node/app/node_modules ./node_modules

CMD ["node", "dist/main.js"]
