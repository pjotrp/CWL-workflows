;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2018 Pjotr Prins <pjotr.guix@thebird.nl>
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (package trimmomatic)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1))

;;; This package downloads a jar file as a binary blob and injects it in the /gnu/store

(define-public trimmomatic-jar
  (package
    (name "trimmomatic-jar")
    (version "0.38")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.38.zip")
       (file-name (string-append name "-" version))
       (sha256
        (base32 "0z34y7f9idnxgnyqdc29z4hwdp8f96mlqssyxvks4064nr1aya6l"))))
    (build-system trivial-build-system)
    (native-inputs
     `(("unzip" ,unzip)
       ("source" ,source)))
    (propagated-inputs
     `(("java" ,icedtea)))
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let* ((source (assoc-ref %build-inputs "source"))
                (target (string-append (assoc-ref %outputs "out")
                                       "/lib/share/jar"))
                (unzip  (string-append (assoc-ref %build-inputs "unzip")
                                       "/bin/unzip")))
           (invoke unzip (assoc-ref %build-inputs "source"))
           (mkdir-p target)
           (copy-recursively "Trimmomatic-0.38" target)
           #t))))
    (home-page "http://www.usadellab.org/cms/index.php?page=trimmomatic")
    (synopsis "Trimmomatic JAR")
    (description "A flexible read trimming tool for Illumina NGS data.")
    (license license:gpl3)))
