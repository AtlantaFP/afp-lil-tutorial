(uiop:define-package :afp.lil.tutorial
  (:use :cl))

(in-package :afp.lil.tutorial)

#|
 As an example of implementing our own custom interfaces
 using the style specified by the Lisp Interface Library
 below we have defined an interface that would be used
 to create generic algorithms that would operate on
 sequence type objects (lists, vectors, etc.)
|#

;;; <sequence>
;;
;; This interface represents the generic operations that should be
;; common to all sequence-style objects. Specifically, objects that
;; adhere to the sequence interface are objects that have the following
;; qualities:
;;  - have a size (i.e. have a size method defined on them)
;;  - can be reduced (i.e. are foldable)
;;  - can be copied (i.e. copyable)
;;  - can be empty (i.e. must implement emptyable interface)
;; Since all the above interface already defined we just need to create
;; a concrete interface implementation that encompasses these
;; "low-level" characteristics through inheritance and implement their
;; methods, specialized on our sequence superclass, already available in CL.
;;
;; A couple of things to note in this implementation. I made this concrete
;; interface as I believe there really should a canonical instance of this
;; interface class be defined.
(lil/core:define-interface <sequence>
    ;; super-interfaces
    (lil/interface/all:<sizable>
     lil/interface/all:<foldable>
     lil/interface/all:<copyable>
     lil/interface/all:<emptyable>)
    ()
  (:singleton))

;; these are the methods that specialize the size interface on
;; sequence interface
(defmethod lil/interface/size:size ((<i> <sequence>) (object sequence))
  (length object))

;; NOTE: the p here means "predicate"
(defmethod lil/interface/size:size<=n-p ((<i> <sequence>) (object sequence) n)
  (<= (lil/interface/all:size <i> object) n))


;; these are the methods that specialize the empty interface on
;; the sequence interface
(defmethod lil/interface/empty:empty ((<i> <sequence>))
  (make-instance 'lil/pure/empty:empty-object))

(defmethod lil/interface/empty:empty-p ((<i> <sequence>) (object lil/pure/empty:empty-object))
  t)

(defmethod lil/interface/empty:empty-p ((<i> <sequence>) (object sequence))
  (= (lil/interface/all:size <i> object) 0))

;; these will implement
