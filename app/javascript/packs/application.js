// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap";
import "../stylesheets/application.scss";
import "../stylesheets/rooms.scss";
import "../stylesheets/common.scss";
import "../stylesheets/users.scss";
import '../images/top-bg.jpg';
import flatpickr from "flatpickr"; 
import "flatpickr/dist/l10n/ja.js";
import "flatpickr/dist/themes/material_green.css"
import '@fortawesome/fontawesome-free/js/all';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", () => {
  flatpickr.localize(flatpickr.l10ns.ja)
  const config = {
    disableMobile: true
  }
  flatpickr('#check_in', config);
  flatpickr('#check_out', config);
});
