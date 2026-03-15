# Hastiq Flutter Prototype (PRD-aligned)

This repository contains a **UI-first Flutter implementation** of Hastiq, a Tinder-style interactive career marketplace.

## What is implemented

### Onboarding & Authentication (mocked)
- Splash screen with brand handoff.
- Role selection: Candidate vs Employer.
- Auth options UI for Google / Apple / Phone OTP (mock completion button).

### Candidate experience
- Swipe-deck style job feed with salary-first cards.
- Story strip (Instagram-style) for employer short videos.
- Apply / Skip / Bookmark actions.
- Match modal and chat entry.

### Employer experience
- Employer dashboard with triage review card.
- Match / Decline candidate controls.
- Post-a-job flow (title, skills, description, salary).
- Story management area for employer branding videos.

### Match & communication
- Match list + chat screen.
- Smart prompts: schedule interview / send portfolio.
- Placeholder attachment actions for PDF and images.

### Personalization & settings
- Profile editor (skills, bio, portfolio).
- Activity tracker (applied, saved, matched).
- Preferences (location, salary threshold, job type).
- Notification toggles, support placeholder, logout action.

### Monetization & analytics (UI placeholders)
- Pay-per-match tile.
- Candidate boost tile.
- Analytics snapshot cards.

## Current limitations
- No real backend integration yet (Firebase/Supabase pending).
- No production auth, push notifications, or payment processing yet.
- Video stories are represented as metadata only.

## Run

```bash
flutter pub get
flutter run
```
