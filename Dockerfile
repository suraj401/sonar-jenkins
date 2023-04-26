FROM node:16.15.1-alpine3.16



COPY --chown=node:node package.json ./
USER node
RUN npm install --legacy-peer-deps
COPY --chown=node:node . .



RUN npm run build --debug


#USER node
EXPOSE 5001
CMD [ "node", "server.js" ]
