# Hero Panel Secondary Button Contrast Fix

**Date:** 2026-05-28  
**Specialist:** Linus (Site/Chrome)  
**Issue:** White-on-white invisible secondary CTA button in homepage hero

## Root Cause

The `.hero-panel` has `color: #fff` (white text), which cascades down to child elements including the plain `.btn` element. JTD's `.btn` class provides a near-white background, resulting in white text on white background—invisible to users.

The secondary "Coaches: Start here" buttons at lines 13 and 67 of `docs/index.md` were affected because:
1. `.hero-panel` sets `color: #fff` on the parent
2. Plain `.btn` (without `.btn-primary`, `.btn-outline`, etc.) defaults to a very light background
3. No scoped override existed to ensure readability

## Solution

Two-layer fix applied:

### Layer 1: CSS Scoped Override (docs/_sass/custom/custom.scss)

Added `.hero-panel .btn:not(.btn-primary):not(.btn-purple)` rule that:
- Sets `color: #1f2937` (dark gray text)
- Sets `background: rgba(255, 255, 255, 0.92)` (opaque white)
- Sets `border-color: rgba(255, 255, 255, 0.6)` for consistency

Hover state enhances visibility with fully opaque white background and darker text.

### Layer 2: btn-outline Class (docs/index.md)

Added `btn-outline` class to both secondary buttons:
- Line 13: `<a class="btn btn-outline" ...>Coaches: Start here</a>`
- Line 67: `<a class="btn btn-outline btn-lg" ...>Coaches: Start here</a>`

The `btn-outline` class is JTD's well-known pattern for outlined buttons (white border + white text), a standard UX convention for secondary CTAs on dark backgrounds. This provides visual backup if CSS fails to render.

## Forward Guidance

**ALL secondary/plain `.btn` elements placed inside a `.hero-panel` must use the `btn-outline` class going forward** to ensure:
1. Consistent UX (outlined style signals secondary action)
2. Readability across CSS override failures
3. Future-proof behavior if JTD updates button defaults

If a new `.btn` is added to `.hero-panel`, pair it with `btn-outline` class automatically.

## Files Modified

- `docs/_sass/custom/custom.scss` — Added scoped `.hero-panel .btn:not(...)` CSS rules
- `docs/index.md` — Added `btn-outline` class to lines 13 and 67

## Verification

- Button renders with dark text on white background ✅
- Hover state enhances legibility ✅
- No other buttons or pages affected ✅
