<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Study Links App</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

<header class="bg-blue-600 text-white p-4 sticky top-0">
  <h1 class="text-xl font-bold text-center">📚 Study Links</h1>
</header>

<div class="p-4">
  <!-- Search -->
  <input id="search" type="text" placeholder="Search..." class="w-full p-2 mb-3 rounded border">

  <!-- Category Filter -->
  <select id="categoryFilter" class="w-full p-2 mb-3 rounded border">
    <option value="All">All Categories</option>
    <option value="Math">Math</option>
    <option value="Science">Science</option>
    <option value="English">English</option>
    <option value="GK">General Knowledge</option>
  </select>

  <!-- Cards Container -->
  <div id="cards" class="grid gap-4"></div>

  <!-- Add Form -->
  <div class="mt-6 bg-white p-4 rounded shadow">
    <h2 class="font-bold mb-2">➕ Add New Link</h2>
    <input id="title" type="text" placeholder="Title" class="w-full p-2 mb-2 border rounded">
    <input id="desc" type="text" placeholder="Description" class="w-full p-2 mb-2 border rounded">
    <input id="url" type="text" placeholder="URL" class="w-full p-2 mb-2 border rounded">
    <select id="category" class="w-full p-2 mb-2 border rounded">
      <option value="Math">Math</option>
      <option value="Science">Science</option>
      <option value="English">English</option>
      <option value="GK">General Knowledge</option>
    </select>
    <button onclick="addLink()" class="bg-blue-600 text-white px-4 py-2 rounded w-full">Add Link</button>
  </div>
</div>

<script>
let links = JSON.parse(localStorage.getItem('links')) || [
  {
    title: "ChatGPT Study Resource",
    desc: "Interactive study content",
    url: "https://chatgpt.com/s/69ddd3e4aed48191b867184e3bd843ad",
    category: "GK"
  },
  {
    title: "Tutor Website",
    desc: "Subject-wise learning platform",
    url: "https://learnodishahelp-cmd.github.io/tutor/",
    category: "Math"
  }
];

function displayLinks() {
  const container = document.getElementById('cards');
  const search = document.getElementById('search').value.toLowerCase();
  const category = document.getElementById('categoryFilter').value;

  container.innerHTML = "";

  links.filter(link => {
    return (
      link.title.toLowerCase().includes(search) &&
      (category === "All" || link.category === category)
    );
  }).forEach(link => {
    const card = document.createElement('div');
    card.className = "bg-white p-4 rounded shadow";
    card.innerHTML = `
      <h3 class="font-bold text-lg">${link.title}</h3>
      <p class="text-sm mb-2">${link.desc}</p>
      <a href="${link.url}" target="_blank" class="text-blue-600 underline">Open Link</a>
    `;
    container.appendChild(card);
  });
}

function addLink() {
  const title = document.getElementById('title').value;
  const desc = document.getElementById('desc').value;
  const url = document.getElementById('url').value;
  const category = document.getElementById('category').value;

  if (!title || !url) {
    alert("Please fill required fields");
    return;
  }

  links.push({ title, desc, url, category });
  localStorage.setItem('links', JSON.stringify(links));

  displayLinks();

  document.getElementById('title').value = "";
  document.getElementById('desc').value = "";
  document.getElementById('url').value = "";
}

document.getElementById('search').addEventListener('input', displayLinks);
document.getElementById('categoryFilter').addEventListener('change', displayLinks);

displayLinks();
</script>

</body>
</html>
