# literally another slides making thingie

But using web components. Because web components are cool.

## Step 1: get them dependencies
The first thing you need to do is get the elements that make `literally` from `bower`:

```
bower install --save notwaldorf/literally
```

`literally` uses Polymer to make web components because that's what I work on,
and writing web components by hand is kind of meh. This doesn't really matter. What does matter is that web components aren't supported in all browsers right now, so `literally` also ships with the `webcomponentsjs` polyfill,
which you should use (unless you hate all browsers that aren't Chrome, in which case you shouldn't).

## Step 2: making a presentation!
In your `index.html` or wherever your presentation lives, you're going to need to
include these elements, the polyfill, and make a presentation out of slides. If your
`index.html` isn't a sibling to your newly created `bower_components` directory,
adjust the path as needed.

```html
<html>
  <head>
  <!-- Include the polyfill -->
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
    <a-presentation>
      <a-slide>
        <div class="title">slide one</div>
      </a-slide>

      <a-slide>
        <div class="title">slide two</div>
      </a-slide>

      <a-slide class="theme-orange">
        <div class="title">If you want to use the theme.</div>
      </a-slide>
    </a-presentation>
  </body>
</html>
```

That's actually it! You have a presentation. All the arrows, space, enter and
clicks (on the left/right side of the slide) should advance/back up the slides.

For a more complicated presentation, check out the `index.html` of _this_ repo.


## Step 3: let's talk about layout
If you don't care about slide layout, I tried to make things easier and
have `a-slide` make some design decisions.
If you don't like these decisions, you don't have to use them. You can just style whatever
content you're passing to the slide. The world is yours:
```html
<a-slide>
  <div class="...">
    <h1>...</h1>
    <h4>...</h4>
  </div>
</a-slide>
```

Now, back to styling.

`<a-slide>` has 3 sections of text, with the classes `pretitle`, `title` and `subtitle`.
You need to include these class names for `<a-slide>` to know where to position things,
but you can also use these classes separately for styling:

```html
<a-slide>
  <div class="pretitle">I am a thing before the title</div>
  <div class="title">I am a giant title!</div>
  <div class="subtitle">I am a subtitle</div>
</a-slide>
```

There's also some centering attributes that try to help:

```html
<a-slide align-center>
  <!-- any content in here will be centered -->
</a-slide>

<a-slide align-right>
  <!-- any content in here will be right aligned -->
</a-slide>

<a-slide align-left>
  <!-- any content in here will be left alignd. This is the default. -->
</a-slide>

<a-slide full-width>
  <!-- the content will span the entire slide -->
</a-slide>
```

## How to contribute
If you're familiar with any Polymer elements, development is pretty similar
to that, using the Polymer [CLI](https://www.polymer-project.org/1.0/docs/tools/polymer-cli):

```
# make sure you have the polymer cli installed
# npm install -g polymer-cli

git clone https://github.com/notwaldorf/literally.git
cd literally
bower install
polymer serve
# navigate to http://localhost:8080/components/literally/demo/ to see the demo
```

## I think that's it!
🍰 and 🍷 for all!
