;; show line number
(global-linum-mode 1)

;; key bindings
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  (defun interprogram-paste ()
    (shell-command-to-string "pbpaste")
    )
  (defun interprogram-copy (text &optional push)
    (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
    (process-send-string proc text)
    (process-send-eof proc)))
    )
  (setq interprogram-copy-function 'interprogram-copy)
  (setq interprogram-paste-function 'interprogram-paste)
  )
