FROM --platform=linux/amd64 node:22-slim

WORKDIR /usr/src/app
RUN corepack enable

COPY package.json pnpm-lock.yaml tsconfig.json ./
RUN pnpm install --frozen-lockfile

COPY src ./src
RUN pnpm build

CMD ["node", "dist/main.js"]
