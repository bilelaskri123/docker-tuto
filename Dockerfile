# method 2
FROM node as base
FROM base as development

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "npm", "run", "start:dev" ]

FROM base as production
WORKDIR /app
COPY package.json .
RUN npm install --only=production
COPY . .
EXPOSE 3000
CMD [ "npm", "start" ]


# how to create multi environment in docker file
# method 1
# FROM node

# WORKDIR /app

# COPY package.json .

# ARG NODE_ENV

# RUN if ["$NODE_ENV" = "production"]; \
#     then npm install --only=production; \
#     else npm install; \
#     fi

# COPY . .

# EXPOSE 3000