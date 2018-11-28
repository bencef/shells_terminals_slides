;;; Presentation --- An outline for the presentation

;;; Commentary:

;; One way stepping is supported

;;; Code:

(require 'demo-it)

;; ----------------------------------------------------------------------
;;  Create some demonstration helper functions...

(defun shells-demo/youtube (url)
  "Play the yt video on the given URL."
  (shell-command
   (format "mpv -fs '%s' >/dev/null 2>&1" url)
   "*yt*" "*yt*")
  (demo-it-presentation-return))

;; ----------------------------------------------------------------------
;; demonstration structure

(demo-it-create :shell :windows-on-right :fast
                (demo-it-title-screen "title.org")
                (demo-it-presentation "slides.org")
                (demo-it-show-image "jacquard1.jpg")
                (shells-demo/youtube "https://www.youtube.com/watch?v=YnnGbcM-H8c")
                (demo-it-presentation-advance)
                (demo-it-presentation-advance)
                (demo-it-start-shell)
                (demo-it-insert-shell "ed /tmp/new_file"))

(demo-it-start)
