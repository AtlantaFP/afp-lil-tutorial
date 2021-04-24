(defpackage :afp.lil.tutorial.utils
  (:use :cl)
  (:export
   #:asort))

(in-package :afp.lil.tutorial.utils)

(defun asort (alist)
  (lil/core:with-interface (lil/interface/all:<number-map> lil/interface/all:<map>)))
