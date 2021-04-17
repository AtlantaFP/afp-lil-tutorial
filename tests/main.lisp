(defpackage afp-lil-tutorial/tests/main
  (:use :cl
        :afp-lil-tutorial
        :rove))
(in-package :afp-lil-tutorial/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :afp-lil-tutorial)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
