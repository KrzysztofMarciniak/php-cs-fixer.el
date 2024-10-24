(defun run-php-cs-fixer-on-buffer ()
  "Run php-cs-fixer on the current PHP buffer and update the buffer with the fixed content."
  (interactive)
  (when (eq major-mode 'php-mode)
    (let* ((temp-file (make-temp-file "php-fix-" nil ".php"))
           (fixer-command (format "php-cs-fixer fix %s --rules='@PHP80Migration,@PSR12,@Symfony,@PhpCsFixer' --allow-risky=no"
                                  (shell-quote-argument temp-file)))
           (cursor-position (point)))
      
      (write-region (point-min) (point-max) temp-file)

      (shell-command fixer-command)

      (let ((fixed-content (with-temp-buffer
                             (insert-file-contents temp-file)
                             (buffer-string))))
        (erase-buffer)
        (insert fixed-content))

      (goto-char cursor-position)

      (delete-file temp-file)

      (message "php-cs-fixer has been applied and the buffer updated."))))

(defun add-php-cs-fixer-on-save ()
  "Automatically run php-cs-fixer before saving the file."
  (when (eq major-mode 'php-mode)
    (add-hook 'before-save-hook 'run-php-cs-fixer-on-buffer nil 'local)))

(add-hook 'php-mode-hook 'add-php-cs-fixer-on-save)
