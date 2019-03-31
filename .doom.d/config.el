;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; ----- FONT CONFIG

(setq doom-font (font-spec :family "Source Code Pro" :size 14)
      doom-variable-pitch-font (font-spec :family "Source Code Pro")
      doom-unicode-font (font-spec :family "Source Code Pro")
      doom-big-font (font-spec :family "Source Code Pro" :size 19))

;; ------- NEOTREE CONFIG
  (require 'neotree)
  (global-set-key [f3] 'neotree-toggle)
(setq doom-neotree-file-icons t)
(setq doom-modeline-icon t)
