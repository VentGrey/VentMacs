;;; init-dashboard.el --- Configuraciones del dashboard.
;; -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Configuración para el dashboard de Emacs.

;;; Code:

(use-package dashboard
  :elpaca t
  :config
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (setq
   dashboard-items '(
                     (recents . 10)
                     (projects . 10)
                     )
   dashboard-center-content t
   dashboard-display-icons-p t
   dashboard-icon-type 'nerd-icons
   dashboard-set-file-icons t
   dashboard-set-navigator t
   dashboard-set-init-info t
   dashboard-startup-banner "~/.config/emacs/banner.png"
   dashboard-banner-logo-title "Emacs prog-rock (e)lisp-osting"
   dashboard-footer-messages (list (nth (random (length my-prog-rock-lyrics)) my-prog-rock-lyrics)))
  :init
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))))

;; Mover la lista de mensajes a otro lugar. Es mas rápido pre-seleccionar
;; nosotros el mensaje aleatorio que dejarle la inicialización a dashboard.
(defvar my-prog-rock-lyrics '(
                              "Couldn't pretend that I felt strong about us anymore..."; Riverside - Second Life Syndrome
                                    
                              "I erase you now with all of my past..."
                              "Forecasting known conclusions..."; Daylight Dies - Ghosting
                              "Don't you wanna see the colours in my head?"; Airbag - Colours
                              "You left a hole where my heart should be..."; Breaking Benjamin - Breath
                              "A sorrow in me..."; Opeth - Burden
                              "I'm in every season. The one you have always loved..."; Katatonia - Shifts
                              "What is wrong? Not with the world but me..."; Katatonia - Tonight's Music
                              "The wound in me is pouring out to rest on a lover's shore..."; Opeth - Isolation Years
                              "Do you wanna know why I keep avoiding your eyes?"; Riverside - Conceiving You
                              "I can't see the meaning of this life I'm leading..."; Opeth - In My Time Of Need
                              "In my own ashes, I am standing without a soul..."; Opeth - To Bid You Farewell
                              "Guess I will always be, your soldier of fortune..."; Deep Purple - Soldier Of Fortune
                              "I'm begging the devil to feed me venom..."; Soen - Lunacy
                              "Will this lunacy allow me to remember who I am?"
                              "I surrender and give in to delusion deep within"
                              "To see you again...if only for another second..."; Opeth - The Night And The Silent Water
                              "Blank face in the windowpane..."; Opeth - Windowpane
                              "There is deep prejudice in me"
                              "I confess my hope, recognize my loneliness"; Opeth - Credence
                              "Is this the end of it all?"; Airbag - Broken
                              "If I had a chance to take it all back. Would you leave me anyway?"
                              "I know we got used to new us..."; Riverside - We Got Used To Us
                              "So walk away with me..."
                              "Pale ghost in the corner"; Opeth - The Drapery Falls
                              "I have lost all trust I had in you..."; Opeth - To Rid The Disease
                              "And I can see you, running through the fields of sorrow"; Opeth - Coil
                              "Soul sacrifice, forgot the advice"; Opeth - A Fair Judgement
                              "I could be foreign forever"; Riverside - The Depth of Self-Delusion
                              "Is this the time I should be on my knees for you?"; Katatonia - Teargas
                              "A wretched deception I am creating"; Opeth - Persephone
                              "Discouraged television sleep"; Katatonia - Deadhouse
                              "The roads are blurred sojourners land"; Katatonia - Decima
                              "And the afterglow was the brave morning"; Opeth - Epilogue
                              "My promise is made but my heart is thine"; Opeth - Face Of Melinda
                              "Unmistakably lost and without a care"; Anathema - Are You There?
                              "Awaiting redeption for a lifetime"; Opeth - The Harlequin Forest
                              "In every way, meaningless scar"; Katatonia - Serein
                              "Remnants of dying laughter"; Anathema - Regret
                              "Melinda is the reason why I've come"; Opeth - The Moor
                              "We miss so much, what we never knew"; Novembers Doom - What Could Have Been
                              "In silent agony, after all these years"; Anathema - Fragile Dreams
                              "Confusion, will be my Epitaph"; King Crimson - Epitaph
                              "My love...goodbye"; Riverside - Acronym Love
                              "I found you, in the dark"; Anathema - Ariel
                              "Om allting tar slut.. Är det värt att vända hem igen?"; Opeth - Allting Tar Slut
                              ))
(provide 'init-dashboard)
;;; init-dashboard.el ends here
