// selecting the elements
const query = document.querySelector("#searchBar");
const submit = document.querySelector("button");
const container = document.querySelector(".container");

// functions
const removeShows = () => {
  container.innerHTML = ""; // clear all previous shows and buttons
};

const printShows = (data) => {
  data.forEach((ele) => {
    if (ele.show.image) {
      const show = ele.show;

      // container div for each show
      const showDiv = document.createElement("div");
      showDiv.classList.add("show-card");

      // show info (image + name)
      const showInfo = document.createElement("div");
      showInfo.classList.add("show-info");

      const img = document.createElement("img");
      img.src = show.image.medium;
      img.alt = show.name;

      const title = document.createElement("p");
      title.textContent = show.name;

      showInfo.appendChild(img);
      showInfo.appendChild(title);

      // form for adding favorite
      const favForm = document.createElement("form");
      favForm.method = "post";
      favForm.action = "favorites";

      const actionInput = document.createElement("input");
      actionInput.type = "hidden";
      actionInput.name = "action";
      actionInput.value = "add";

      const showIdInput = document.createElement("input");
      showIdInput.type = "hidden";
      showIdInput.name = "showId";
      showIdInput.value = show.id;

      const showNameInput = document.createElement("input");
      showNameInput.type = "hidden";
      showNameInput.name = "showName";
      showNameInput.value = show.name;

      const favButton = document.createElement("button");
      favButton.type = "submit";
      favButton.textContent = "Add to Favorites";
      favButton.classList.add("fav-btn");

      favForm.appendChild(actionInput);
      favForm.appendChild(showIdInput);
      favForm.appendChild(showNameInput);
      favForm.appendChild(favButton);

      // append info and form to showDiv
      showDiv.appendChild(showInfo);
      showDiv.appendChild(favForm);

      // append showDiv to container
      container.appendChild(showDiv);
    }
  });
  query.value = "";
};

const err = () => {
  const errM = document.createElement("p");
  errM.append("Oh, no! Connection error");
  document.body.append(errM);
};

let cnt = 0;
const fetchData = async () => {
  try {
    fetch("search", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: new URLSearchParams({
        query: query.value,
      }),
    });

    const config = { params: { q: query.value } };
    const res = await axios.get("https://api.tvmaze.com/search/shows", config);
    cnt++;
    if (cnt > 1) removeShows();
    printShows(res.data);
  } catch (e) {
    err();
  }
};

// event listeners
submit.addEventListener("click", fetchData);

