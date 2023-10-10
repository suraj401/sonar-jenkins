FROM openjdk:17-jdk-slim-buster



COPY --chown=node:node package.json ./
USER node
RUN npm install --legacy-peer-deps
COPY --chown=node:node . .



RUN npm run build --debug


#USER node
EXPOSE 5001
CMD [ "node", "server.js" ]
