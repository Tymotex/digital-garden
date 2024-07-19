---
title: CSS Cookbook
---

A collection of tricks and common things to achieve with [[Knowledge/Engineering/Languages/CSS|CSS]].

## Centering
[Complete guide to centering](https://css-tricks.com/centering-css-complete-guide/).
- **Centering horizontally**:
    - Inline? `text-align: center` on the parent.
    - Block? `margin: 0 auto; width: 200px`.
    - Multiple blocks? `display: flex; justify-content: center`.
    - Hack: 
        ```css
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    ```
- **Centering vertically**:
    - Inline (text)?: 
    ```css
    .center-text {
        height: 100px;
        line-height: 100px;
        white-space: nowrap;
    }
    ```
    - Block?
    ```css
    display: flex;
    flex-direction: column;
    justify-content: center;
    ```
    - Hack: 
        ```css
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    ```

## Images
- [Fluid images](https://unstoppablerobotninja.com/entry/fluid-images/) to prevent images from ever overflowing: `img { max-width: 100%; }`. 
- To make background images fit neatly into cards:
    ```css
    aspect-ratio: 16/9;
    background-image: ...;
    background-size: cover;
    background-position: center;
    ```
- To make `<img>` keep its aspect ratio despite its dimensions:
    ```css
    width: 100px;
    height: 100px;
    object-fit: cover;      /* Image is clipped along its width. */
                contain;    /* Image changes its dimension to fully fit inside the dimensions. */
    ```

## Misc
- You can combine different units in a `calc` expression, for example: `height: calc(100vh - 100px)`.
```css
display: grid
grid-template-columns: repeat(auto-fit, minmax(150px, 1fr))
```
