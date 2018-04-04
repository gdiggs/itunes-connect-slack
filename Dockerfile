FROM starefossen/ruby-node:2-8

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY package.json .
RUN yarn install

COPY . .

CMD fastlane fastlane-credentials add --username $FASTLANE_USERNAME --password $FASTLANE_PASSWORD && \
    node poll-itc.js
