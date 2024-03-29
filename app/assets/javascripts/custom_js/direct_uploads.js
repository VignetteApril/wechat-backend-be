addEventListener("direct-upload:initialize", function(event) {
  const target = event.target;
  const detail = event.detail;
  const id = detail.id;
  const file = detail.file;
  target.insertAdjacentHTML("beforebegin", `
    <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
      <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
      <span class="direct-upload__filename">${file.name}</span>
    </div>
  `);
});

addEventListener("direct-upload:start", function(event) {
  const id = event.detail.id;
  const element = document.getElementById(`direct-upload-${id}`);
  element.classList.remove("direct-upload--pending");
});

addEventListener("direct-upload:progress", function(event) {
  const id = event.detail.id;
  const progress = event.detail.progress;
  const progressElement = document.getElementById(`direct-upload-progress-${id}`);
  progressElement.style.width = `${progress}%`;
});

addEventListener("direct-upload:error", function(event) {
  event.preventDefault();
  const id = event.detail.id;
  const error = event.detail.error;
  const element = document.getElementById(`direct-upload-${id}`);
  element.classList.add("direct-upload--error");
  element.setAttribute("title", error);
});

addEventListener("direct-upload:end", function(event){
  const id = event.detail.id;
  const element = document.getElementById(`direct-upload-${id}`);
  element.classList.add("direct-upload--complete");
});
