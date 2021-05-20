import $ from "jquery";

const initFileinput = () => {
  $(".clickable-photo-input").bind("change", function () {
    var filename = $(".clickable-photo-input").val();
    if (/^\s*$/.test(filename)) {
      $(".file-upload").removeClass("active");
      $("#noFile").text("No file chosen...");
    } else {
      $(".file-upload").addClass("active");
      $("#noFile").text(filename.replace("C:\\fakepath\\", ""));
    }
  });
};

export { initFileinput };
