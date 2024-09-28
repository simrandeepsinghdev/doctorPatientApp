# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "controllers", to: "controllers.js"
pin "chartkick"
pin "chart.js", to: "https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.umd.min.js"

pin_all_from "app/javascript/controllers", under: "controllers"
