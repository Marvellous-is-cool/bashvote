# Bashvote (votingbash)

A lightweight, production-ready web application for running award-style online voting. It lets administrators define award titles, add contestants, associate contestants with awards, and collect paid votes from users. The app tracks votes and payments, provides an admin dashboard to monitor performance, and renders a clean public experience for discovering awards and voting for contestants.

## What It Is
- A Node.js + Express + EJS server-rendered app for online voting.
- Backed by MySQL for persistent storage and optional Redis integration for rate limiting/caching.
- Designed for straightforward deployment and operation with minimal infrastructure overhead.

## What It Does
- Award management: create and organize award titles.
- Contestant management: add contestants with photos, levels/departments, and link them to awards.
- Voting flow: users discover awards/contestants and cast votes via a payment flow.
- Payments tracking: records transactions (amount, status, date) and associates them to the chosen award and contestant.
- Live/aggregated stats: shows contestant vote counts and a payments overview (including totals) on the admin dashboard.
- File uploads: stores contestant photos under `uploads/` and serves them in views.
- Session + flash messaging: provides simple admin login and feedback to users/admins.
- Rate limiting: optional Redis-backed rate limiter to protect endpoints.

## Who Uses It
- Event organizers or communities running polls (e.g., Most Popular, Best Performance, Rising Star).
- Admin teams that need a simple dashboard to monitor contestants, votes, and payments.

## High-Level Architecture
- Server: Express app with EJS views and classic MVC-style controllers.
- Persistence: MySQL tables for admins, awards, contestants, many-to-many award–contestant links, and payments.
- Caching/limits: Redis (via `ioredis`) can be used to back rate limiting where configured.
- Views: EJS templates for both public pages and the admin area.

## Data Model (Overview)
- `admins`: admin authentication records.
- `awards`: award titles (unique names).
- `contestants`: contestant profiles with nickname, level, department, photo, and `votes` counter.
- `award_contestants`: junction table linking contestants to awards.
- `payments`: transactions linked to an `award_id` and `contestant_id`, with `status` and `payment_date`.
- `config`: key–value store for feature flags and app settings.

## Tech Stack
- Runtime: Node.js / Express
- Templates: EJS
- Database: MySQL (via `mysql2`)
- Optional: Redis (via `ioredis`) for rate limiting (`rate-limit-redis`)
- UI: Bootstrap and Font Awesome (via CDN)

## Repository Structure
- `app.js`: Express server bootstrap and app wiring.
- `controllers/`: request handlers (admin, client, award–contestant linking, uploads, etc.).
- `middlewares/`: async handler, auth, error handling, and rate limiter.
- `models/`: DB connection, configuration, and schema (`schema.sql`).
- `public/`: static assets (images, scripts, styles).
- `routes/`: Express route definitions for admin and client-facing endpoints.
- `scripts/`: utilities (e.g., Redis test script).
- `uploads/`: uploaded contestant photos.
- `views/`: EJS templates for public and admin pages.

## Notes & Considerations
- Security: The sample schema seeds a default admin with a plain-text password. Replace and store admin passwords using a strong hash in production.
- Payments: The system records payment rows and surfaces totals/amounts in the admin overview. UI formatting uses locale-aware separators for readability.
- Images: Uploaded photos are stored on the server filesystem (`uploads/`). Employ appropriate storage/backup and validation in production.
- Configuration: Environment configuration (e.g., DB credentials, Redis, payment keys) should be set via environment variables.

## Limitations
- Single-tenant admin model; extend as needed for multi-role or multi-tenant setups.
- Server-side rendered EJS views; migrate or augment with an API/SPA as requirements grow.

---

This README describes the purpose and capabilities of the project to keep the repository organized and understandable at a glance.