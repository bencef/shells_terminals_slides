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

;; kill leftover Shell window
(ignore-errors
  (kill-buffer "Shell")
  (shell-command "rm /tmp/new_file")
  (shell-command "xmodmap xmodmap"))

(demo-it-create :shell :insert-fast :windows-on-right
                (demo-it-title-screen "title.org")
                (demo-it-presentation "slides.org")
                (demo-it-show-image "jacquard1.jpg")
                (shells-demo/youtube "https://www.youtube.com/watch?v=YnnGbcM-H8c")
                demo-it-presentation-advance
                demo-it-presentation-advance
                demo-it-start-shell
                "C-u C-x o"
                (demo-it-insert-shell "ed /tmp/new_file")
                demo-it-presentation-advance
                (demo-it-insert-shell "a")
                demo-it-presentation-advance
                (demo-it-insert-shell "def foo(i):")
                (demo-it-insert-shell "  if i > 3:")
                (demo-it-insert-shell "    print(\"wooohoo\")")
                demo-it-presentation-advance
                (demo-it-insert-shell ".")
                demo-it-presentation-advance
                (demo-it-insert-shell "1,$s/i/arg/g")
                demo-it-presentation-advance
                (demo-it-insert-shell "1,$p")
                demo-it-presentation-advance
                (demo-it-insert-shell "u")
                (demo-it-insert-shell "1,$s/\\([^a-z]\\)i\\([^a-z]\\)/\\1arg\\2/g")
                (demo-it-insert-shell "1,$p")
                demo-it-presentation-advance
                (demo-it-insert-shell "w")
                (demo-it-insert-shell "q")
                demo-it-presentation-return
                (demo-it-show-image "vt100.jpg")
                demo-it-presentation-return
                demo-it-presentation-advance
                demo-it-presentation-advance
                demo-it-presentation-advance
                demo-it-show-shell
                (demo-it-insert-shell "ls -l")
                (demo-it-insert-shell "ls -a")
                demo-it-presentation-advance
                (demo-it-insert-shell "wc -l < present.el")
                demo-it-presentation-advance
                (demo-it-insert-shell "export PS1='→ '")
                demo-it-presentation-advance
                (demo-it-insert-shell "for i in 1 2 3")
                (demo-it-insert-shell "do")
                (demo-it-insert-shell "  echo number $i")
                (demo-it-insert-shell "done")
                demo-it-presentation-advance
                demo-it-presentation-advance
                demo-it-presentation-advance
                (demo-it-insert-shell "export TEXT_FILES=$(file * | grep -E 'ASCII|UTF' | cut -d: -f1)")
                (demo-it-insert-shell "echo $TEXT_FILES")
                demo-it-presentation-advance
                (demo-it-insert "cat $TEXT_FILES | tr -c a-zA-Z '\\n' | sort")
                (demo-it-insert-shell "")
                demo-it-presentation-advance
                (demo-it-insert "!! | uniq -c | sort -n")
                (demo-it-insert-shell "")
                demo-it-presentation-advance
                (demo-it-insert-shell "history | tail")
                demo-it-presentation-return
                (demo-it-load-file "word_freq.sh")
                demo-it-presentation-return
                demo-it-presentation-advance
                demo-it-presentation-advance
                demo-it-presentation-advance
                (shell-command "pharo_demo"))

(demo-it-start)
