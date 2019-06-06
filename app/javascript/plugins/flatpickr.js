import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"
import "flatpickr/dist/themes/light.css" // Note this is important!

flatpickr(".datepicker", {
    "locale": French,
    altInput: true,
    enableTime: true,
    disableMobile: true
})
