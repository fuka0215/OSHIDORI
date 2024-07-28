// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

/* global google */

document.addEventListener('turbolinks:load', function () {
  const inputAddress = document.getElementById('Address');
  
  if (inputAddress) {
    // ログを出力して要素が見つかったことを確認
    console.log('Address input element found:', inputAddress);

    // オートコンプリートのオプション
    const options = {
      componentRestrictions: { country: 'JP' },
    };

    // オートコンプリート適用
    const autocompleteAddress = new google.maps.places.Autocomplete(inputAddress, options);

    // 住所のオートコンプリートが選択されたとき
    autocompleteAddress.addListener('place_changed', function() {
      const place = autocompleteAddress.getPlace();
      
      // 選択された場所の情報をログに出力
      console.log('Selected place:', place);
      
      if (place.geometry) {
        inputAddress.value = place.formatted_address;
        console.log('Formatted address:', place.formatted_address);
      } else {
        console.log("No details available for input: '" + place.name + "'");
      }
    });
  } else {
    console.error('Address input element not found');
  }
});
