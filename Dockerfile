FROM eclipse-temurin:17-jdk-alpine



COPY --chown=node:node package.json ./
USER node
RUN npm install --legacy-peer-deps
COPY --chown=node:node . .



RUN npm run build --debug


#USER node
EXPOSE 5001
CMD [ "node", "server.js" ]
