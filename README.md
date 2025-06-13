# Generative Jewels

![Generative Jewels banner](docs/banner.png)

> Procedurally generated jewel illustrations triggered by a single random seed, written in Processing.

## About

**Generative Jewels** is a tiny Processing sketch that draws crystalline *jewel* shapes built from quadratic‑vertex polygons. Give it a seed and you'll always get the exact same gemstone; change the seed and you'll get a brand‑new cut.

Images can be exported up to poster resolution (tested at 4K) and are perfect for wallpapers, album art or print.

## How it works

1. The sketch picks an **outer radius** and **inner radius** for the shape.
2. A random number of facets (between 5‑12 by default) is chosen.
3. Each facet colour is picked from the HSB colour space.
4. Quadratic Bézier vertices connect the points, creating smooth, gem‑like edges.

Because all randomness is driven through Processing’s `random()` function, calling `randomSeed(seed)` anywhere before `draw()` will make the output fully deterministic.

```java
void setup() {
  randomSeed(42);   // 👈 same jewel every run
  ...
}
```

## Getting started

1. **Install Processing 4** or higher from [https://processing.org/download](https://processing.org/download).
2. Clone this repo or download the ZIP.
3. Open `genjewles2.pde` in the Processing IDE.
4. Press **Run** (⌘R / Ctrl‑R).

The sketch renders at **1200 × 1200 px** by default and refreshes once per second (`frameRate(1)`).

### Saving a single PNG

Set the boolean at the top of the file:

```java
boolean saveOne = true;
```

The next frame will be written to `Exports/YYYYMMDD‑HHMMSS.PNG` and the flag resets, so you’ll never overwrite a file by accident.

### Tweaking parameters

| Constant | Description                        | Typical range             |
| -------- | ---------------------------------- | ------------------------- |
| `outer`  | Radius of the outermost points     | 500–700                   |
| `inner`  | Radius of the inner control points | `outer`‑200 → `outer`‑300 |
| `facets` | Number of sides                    | 5–12                      |

Feel free to add your own palettes, animation, or SVG export.

## Command‑line rendering (optional)

Processing sketches can be rendered headless:

```bash
processing-java --sketch=/path/to/GenerativeJewels \
                --output=/path/to/output \
                --run \
                --present \
                --args 12345      # seed
```

## Gallery

A handful of random seeds and their resulting jewels. Add your own favourites!

| Seed    | Preview                        |
| ------- | ------------------------------ |
| 8675309 | ![](docs/examples/8675309.png) |
| 42      | ![](docs/examples/42.png)      |
| 123456  | ![](docs/examples/123456.png)  |
| 987654  | ![](docs/examples/987654.png)  |

## Roadmap

* [ ] Make palette system pluggable
* [ ] Add SVG / PDF export
* [ ] CLI option for batch rendering

## Contributing

Issues and pull requests are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

MIT © 2025 YourName
