#!/bin/bash

# 未実行のマイグレーションを適用する
bundle exec rails db:migrate

# Renderが割り当てたポートでRailsサーバーを起動する
bundle exec rails server -b 0.0.0.0 -p $PORT