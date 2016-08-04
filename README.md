# literally another slides making thingie

But using web components. Because web components are cool. `literally` doesn't do
any fancy animations or builds, and it forces you to only have a
chunk of big text on your slide. It looks like this:

<img width="1438" alt="screen shot 2016-08-04 at 10 55 55 am" src="https://cloud.githubusercontent.com/assets/1369170/17412531/14cee48c-5a32-11e6-990c-a3190591f402.png">


## Making your first presentation
1. Download this from `bower`:
```
bower install --save notwaldorf/literally
```
2. Create an `index.html` file that's a sibling to the newly created `bower_components` directory. If you want a different directory structure,
adjust the paths in the example as needed.
3. Add this to it:

```html
<html>
  <head>
  <!-- Include the polyfill, since web components aren't supported everywhere yet -->
  <script src="bower_components/webcomponentsjs/webcomponents-lite.js"></script>

  <!-- Import the elements -->
  <link rel="import" href="bower_components/literally/a-presentation.html">
  <link rel="import" href="bower_components/literally/a-slide.html">

  <!-- Optional: I also made you a basic theme that you can start with -->
  <link rel="stylesheet" href="bower_components/literally/sample-theme.css">
  <style>
    /* The least you can do if you don't include the theme */
    body {
      margin: 0;
      font-family: sans-serif;
    }
  </style>
  </head>
  <body>
    <a-presentation animated>
      <a-slide>
        <div class="title">slide one</div>
      </a-slide>

      <a-slide>
        <div class="title">slide two</div>
      </a-slide>

      <!-- a slide using the theme. There's also theme-blue -->
      <a-slide class="theme-orange">
        <div class="title">slide three</div>
      </a-slide>
    </a-presentation>
  </body>
</html>
```

That's actually it! You have a presentation!! Arrows, space, enter and
clicks advance/back up the slides. For slide ideas, check out this repo's demo.

## What about the slide layout?
If you don't care about the slide layout, I tried to make things easier and
have `a-slide` make some design decisions.
If you don't like these decisions, you don't have to use them! You can just style whatever
content you're passing to the slide. The world is yours:
```html
<a-slide>
  <div class="...">
    <h1>...</h1>
    <h4>...</h4>
    ...
  </div>
</a-slide>
```

Now, back to styling.

`<a-presentation>` has an `animated` attribute. If you set it, you'll get sliding transitions
between your slides.

`<a-slide>` has 3 sections of text, with the CSS classes `pretitle`, `title` and `subtitle`.
You need to include these class names for `<a-slide>` to know where to position things,
but you can also use these classes separately for styling:

```html
<style>
.title { color: papayawhip; }
</style>
<a-slide>
  <div class="pretitle">I am a thing before the title</div>
  <div class="title">I am a giant title!</div>
  <div class="subtitle">I am a subtitle</div>
</a-slide>
```

There are also some `<a-slide>` attributes that try to help position the text:

```html
<!-- different horizontal centering -->
<a-slide align-center>...</a-slide>
<a-slide align-right>...</a-slide>
<a-slide align-left>...</a-slide>

<!-- the content will span the entire slide -->
<a-slide full-width>...</a-slide>
```

## How to contribute
If you're familiar with any [Polymer elements](https://www.polymer-project.org/1.0/docs/tools/reusable-elements), development is pretty similar to that, using the Polymer [CLI](https://www.polymer-project.org/1.0/docs/tools/polymer-cli):

```
# If you haven't installed the Polymer CLI before, run this:
# npm install -g polymer-cli

# Get the code
git clone https://github.com/notwaldorf/literally.git
cd literally

# Get its dependencies
bower install

# Run the demo
polymer serve
# navigate to http://localhost:8080/components/literally/demo/ to see the demo
```

## I think that's it!
🍰 and 🍷 for all!
