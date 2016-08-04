# literally

Yup. It's literally another slides making thingie. But using web components.
Because web components are cool.

## Preamble: dependencies
`literally` actually uses Polymer to make web components because that's what I work on, and writing web components by hand is kind of painful. This doesn't matter. What does matter is that web components aren't supported on all the browsers right now, so the first thing you're going to need is to include the `webcomponentsjs` polyfill (unless you hate all browsers that aren't Chrome, in which case don't include it). You can get it, along with these elements, from `bower`:

```
bower install --save webcomponents/webcomponentsjs#^0.7.0
bower install --save notwaldorf/literally
```


## Making a presentation!
In your `index.html` or wherever your presentation lives, you're going to need to include these elements and the polyfill:

```html
<script src="bower_components/webcomponentsjs/webcomponents-lite.js"></script>

<link rel="import" href="bower_components/literally/a-presentation.html">
<link rel="import" href="bower_components/literally/a-slide.html">

<!-- I also made you a basic theme that you can play with -->
<link rel="stylesheet" href="bower_components/literally/sample-theme.css">
```

A presentation is made of slides:

```html
<a-presentation>
  <a-slide>
    <div class="title">slide one</div>
  </a-slide>

  <a-slide>
    <div class="title">slide two</div>
  </a-slide>
</a-presentation>
```

If you don't care about slide layout, I tried to make things easier and have `a-slide` make some design decisions. It has 3 sections of text, with the classes `pretitle`, `title` and `subtitle`. You need to include these class names for `<a-slide>` to know where to position things, but you can also use these classes separately for styling:

```
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

You of course don't need to use any of these helpers, and just style whatever content you're passing to the slide. The world is yours:
```html

<a-slide>
  <div class="...">
    <h1>...</h1>
    <h4>...</h4>
  </div>
</a-slide>
```
