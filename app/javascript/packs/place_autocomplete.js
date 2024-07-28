// Place Autocomplete
document.addEventListener('DOMContentLoaded', function () {
  const inputTitle = document.getElementById('Title');
  const inputAddress = document.getElementById('Address');

  // オートコンプリートのオプション
  const options = {
    types: ['establishment'],
    componentRestrictions: { country: 'JP' },
  };

  // オートコンプリート適用
  const autocompleteAddress = new google.maps.places.Autocomplete(inputAddress, options);

  // 住所のオートコンプリートが選択されたとき
  autocompleteAddress.addListener('place_changed', function() {
    const place = autocompleteAddress.getPlace();
    inputTitle.value = place.name;
    inputAddress.value = place.formatted_address;
  });
});
