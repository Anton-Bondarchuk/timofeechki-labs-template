FROM node:20.11 as build
RUN npm i --global pnpm
WORKDIR /opt/work
COPY .npmrc package.json pnpm-lock.yaml /opt/work/
#COPY project.inlang /opt/work/project.inlang/
RUN pnpm install --frozen-lockfile

COPY . .

RUN pnpm run build

FROM nginx:1.25.4-alpine
EXPOSE 11002
COPY --from=build /opt/work/nginx/conf.d /etc/nginx/conf.d
COPY --from=build /opt/work/build /opt/work/build
COPY --chmod=755 99-entrypoint-handlers.sh /docker-entrypoint.d/99-entrypoint-handlers.sh
RUN sed -i '/^#!.*$/a env > /tmp/env' /docker-entrypoint.sh
