document.addEventListener("turbolinks:load", () => {
  flatpickr.localize(flatpickr.l10ns.ja)
  const config = {
    inline: true,
    disableMobile: true
  }
  flatpickr('#check_in', config);
  flatpickr('#check_out', config);
});
