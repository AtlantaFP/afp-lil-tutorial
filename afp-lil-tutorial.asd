(defsystem "afp-lil-tutorial"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("alexandria"
               "lil")
  :components ((:module "src"
                :components
                ((:file "sequence")
                 (:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "afp-lil-tutorial/tests"))))

(defsystem "afp-lil-tutorial/tests"
  :author ""
  :license ""
  :depends-on ("afp-lil-tutorial"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for afp-lil-tutorial"
  :perform (test-op (op c) (symbol-call :rove :run c)))
