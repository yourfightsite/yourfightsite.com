# Install and build NPM dependencies
FROM node:22-alpine AS node

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm install

# Build and run the application
FROM ruby:3.3.5

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
COPY --from=node /usr/src/app/node_modules ./node_modules

CMD ["jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--watch"]
