import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const datepickr = document.querySelector(".datepicker");
  if (!datepickr) return;

  flatpickr(".datepicker", {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    minDate: "today",
    maxDate: new Date().fp_incr(35),
    "disable": [
        function(date) {
          const form = document.getElementById('new_rental')
          const blockedDates = JSON.parse(form.dataset.blockedDates).map((date) => {
            const d = (new Date(date))
            return d.setHours(0)
          })
            // return true to disable
            return blockedDates.includes(date.getTime());
        }],
  });
}

export { initFlatpickr }
