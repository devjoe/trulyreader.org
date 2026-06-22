# trulyreader.org

Small public website for Truly.

Current purpose:

- publish the canonical privacy policy at `https://trulyreader.org/privacy`;
- keep Chrome Web Store and public early preview release links stable;
- avoid mixing website lifecycle with the extension source repository.

## Local Preview

Open `index.html`, `zh/index.html`, `privacy/index.html`, or
`feedback/index.html` in a browser.
The site is static and does not require a build step.

## Homepage Notes

### 2026-06-21

- The homepage order is hero, Chrome Extension preview, Project Roadmap, Feedback, then footer.
- The Chrome Extension preview uses the looping `assets/truly-demo-balanced.mp4` without playback controls, with the surrounding copy condensed into the video caption and call-to-action row.
- The roadmap uses a generated background plus cropped circular node artwork. The canonical assets for the current roadmap are:
  - `assets/truly-roadmap-flow-background-v3.png`
  - `assets/truly-roadmap-node-browser-extension-cutout-v3.png`
  - `assets/truly-roadmap-node-mobile-apps-cutout-v3.png`
  - `assets/truly-roadmap-node-desktop-apps-cutout-v3.png`
  - `assets/truly-roadmap-node-community-cutout-v3.png`
- `prototypes/roadmap-node-positioner.html` is the adjustment tool for roadmap node image offsets and should be kept in sync with the production CSS variables in `index.html`.
- The footer keeps `Truly · 梳理 — to comb through and clarify.` as the identity line, with `The idea for Truly began in Taiwan.` as a lighter secondary note.
- Visual checks from the implementation session were captured under `/private/tmp/`, including `truly-footer-origin-final-desktop.png` and `truly-footer-origin-final-mobile.png`.
- The hero concept image was updated to the selected lower-right tabletop cleanup variant. Regenerate `assets/truly-hero-context-map-local-motion.mp4` with `prototypes/generate-hero-local-motion.sh` after replacing `assets/truly-hero-context-map.png`; the current green confirmation pulse is centered at `x=1156, y=492` in the 1280x852 video frame. Verification crops were saved as `/private/tmp/truly-hero-motion-context-crop-v2.png` and `/private/tmp/truly-hero-motion-context-crosshair-v2.png`.
- The Traditional Chinese homepage lives at `zh/index.html`. The English
  homepage links to it with `hreflang="zh-Hant"`, and the Chinese page links
  back to `/` with `hreflang="en"`.
- The Chinese homepage uses native Traditional Chinese copy rather than a
  literal translation. Its header keeps the Truly wordmark plus the spaced
  subtitle `梳 理`, matching the extension settings page brand treatment.
- The Chinese feedback band is intentionally reduced to one prompt:
  `請告訴我們，哪些閱讀場景最需要被梳理。`
- The Chinese footer intentionally reuses the English footer content for
  identity consistency.
- The favicon uses the Truly dot mark rather than the full social preview image:
  `assets/favicon.svg`, `assets/favicon-32.png`, `assets/apple-touch-icon.png`,
  and root `favicon.ico`.
- Final homepage QA artifacts for the English and Chinese pages were saved
  under `/private/tmp/` as `truly-homepage-final-{en,zh}-{desktop,mobile}.png`.

## GitHub Pages

Publish from the `main` branch root. The custom domain is set by `CNAME`.
