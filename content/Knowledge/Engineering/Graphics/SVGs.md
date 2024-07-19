---
title: SVGs
description: SVGs
---

SVG (*scalable vector graphics*) is an image format that defines images using vectors in XML on a cartesian plane rather than pixels, like PNG or JPEG, which we call *bitmapped* or *raster* image formats.

Some advantages SVGs have over other image formats:
- Retains image quality at any zoom level, unlike .png files. This is the main advantage.
- For simple SVGs, it's easy to modify the image by tweaking the source code (which is just XML, usually).
- They are sometimes more performant if the image is not visually complex. For example, they're great for displaying icons on webpages.
- You can manipulate SVGs elements on a webpage with JavaScript and apply CSS styles to them, like regular HTML elements.

![[Knowledge/Engineering/Graphics/assets/raster-vs-vector.png|400]]

You can define any image using vectors or pixels, however which choice is better depends on how you expect to use the image. 
- For logos, SVGs are better.
- For diagrams, charts, figures, SVGs are better.
- For images with 'clean lines' and simple shapes, SVGs are probably better.
- For photographs, wallpapers and other images composed of very complex visuals, then SVGs aren't ideal because they'll be huge in size. 

## Drawing SVGs
It's hard to create SVGs by manually writing the XML code for the individual vectors that comprise an image. Instead, you should be using tools like Figma, Illustrator, Photoshop, etc. and you can also use some of these tools to convert between SVG and raster image formats. You can even use javascript libraries like [[Knowledge/Engineering/Technologies/D3|D3.js]] to create SVGs.

## SVG Elements
Just as HTML provides elements like `<p>`, `<div>`, `<table>` for describing documents, SVG provides elements like `<g>`, `<circle>`, `<line>` for defining images.

There are lot of SVG elements. See this [full reference on MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Element).

### Important Details
- In XML, you should specify the `xmlns` attribute which sets the XML namespace. Doing this is to [prevent name collisions](https://stackoverflow.com/questions/1181888/what-does-xmlns-in-xml-mean) where, for example, `<g>` might appear in a context outside of the SVG definition. Specifying the namespace removes the ambiguity about what `<g>` and other SVG elements are meant to do.
- Element ordering matters, just like in HTML. Elements defined later are rendered on top of previous elements.
- Basic styling of SVG elements can be done with the `fill`, `fill-*` and `stroke`, `stroke-*` attributes.

### \<svg\>
`<svg>` is the root element of an image, just like how `<html>` is the root element of a document. You must always bind the `xmlns` to a namespace URI, eg. `<svg xmlns="http://www.23.org/2000/svg">`.

Using this element, we define the coordinate system:
![[Knowledge/Engineering/Graphics/assets/svg-coordinate-system.png|220]]
**Attributes**:
- `width` and `height` of the SVG container on an HTML document.
- `viewBox` defines the portion of the SVG 'canvas' to display.

### \<g\>
`<g>` doesn't draw anything, it just groups together other basic shapes. The point of doing this is to be able to apply transformations to a whole group of elements, and set attributes like `fill` that should be inherited by all of its children.

### \<rect\>
- `x` and `y` set the coordinate of where the top left corner of the rectangle sits.
- `width` and `height` set the dimensions.
- `rx` and `ry` set the horizontal and vertical border radii.

### \<circle\>, \<ellipse\>
- `cx`, `cy` set the center coordinates.
- `r` sets the radius
- `rx`, `ry` set the x and y radius for an ellipse.

### \<line\>
Lines are defined based on a starting coordinate $(x_{1}, y_1)$ and ending coordinate $(x_{2},y_2)$.

**Attributes**:
- `x1`, `y1`
- `x2`, `y2`

### \<path\>
Path elements can draw any shape, including the default ones like rect, circle, line, etc. You define them by specifying the `d` (data) attribute, which is a sequence of commands.

**[Path commands](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d#path_commands)**:
- **Move-to**:
    - `M 3 5` — moves from to the absolute coordinate $(3, 5)$.
    - `m 3 5` — moves 3 units right and 5 units down relative to the current coordinate.
- **Line-to**:
    - `H 10` — draws a horizontal line from the current point until `x=10` on the coordinate system.
    - `V 10` — draws a vertical line from the current point until `y=10` on the coordinate system.
- **Closing the path**:
    - `Z` — this just draws a line back to the initial point, closing the path. This is usually used as the last command.
- **Quadratic Bézier**. You define them with a starting point, a control point and an ending point. The starting point is simply where the current coordinate is, so you don't have to specify it.
    - $\texttt{Q }x_c,y_{c}\texttt{  }x_2,y_2$
    ![[Knowledge/Engineering/Graphics/assets/quadratic-bezier.gif|300]]
- **Cubic Bézier**. They're like quadratic bezier curves, but with another control point.
    - $\texttt{C }x_{c1},y_{c2}\texttt{  }x_{c2},y_{c2}\texttt{  }x_2,y_2$
    ![[Knowledge/Engineering/Graphics/assets/cubic-bezier.gif|300]]
- **Arc**. These are just the sections of circles or ellipses. See [MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths#arcs).

### \<polygon\>
Polygons are all n-sided shapes. You define them by simply specifying a list of points.
- `points` — a list of coordinate points. A list of coordinates $(0, 1), (2, 5), (3, 2)$ looks like `<polygon points="0, 1 2, 5 3, 2"`.

### \<text\>
You can also add text to any SVG. You control its location with `x` and `y` attributes, and just like for regular HTML text, you can apply CSS style rules like `font-family`, `font-weight`, etc.

Additional attributes specific to `<text>` include:
- [`text-anchor`](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/text-anchor)
- [`alignment-baseline`](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/alignment-baseline)


