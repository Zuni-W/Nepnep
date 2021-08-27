; ModuleID = 'baby.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@map = global [5 x [5 x i8]] [[5 x i8] zeroinitializer, [5 x i8] zeroinitializer, [5 x i8] c"\00\00\04\00\00", [5 x i8] c"\00\00\00\03\00", [5 x i8] zeroinitializer], align 16
@row = global [5 x [4 x i8]] [[4 x i8] c"\00\00\00\01", [4 x i8] c"\01\00\00\00", [4 x i8] c"\02\00\00\01", [4 x i8] zeroinitializer, [4 x i8] c"\01\00\01\00"], align 16
@col = global [4 x [5 x i8]] [[5 x i8] c"\00\00\02\00\02", [5 x i8] zeroinitializer, [5 x i8] c"\00\00\00\01\00", [5 x i8] c"\00\01\00\00\01"], align 16
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@input = common global [100 x i8] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [15 x i8] c"CISCN{MD5(%s)}\00", align 1
@input_unhex = common global [100 x i8] zeroinitializer, align 16
@steps = common global [100 x i8] zeroinitializer, align 16

; Function Attrs: norecurse nounwind readonly uwtable
define zeroext i1 @docheck() #0 {
  %vis = alloca [6 x i8], align 1
  %vis5 = alloca [6 x i8], align 1
  %1 = getelementptr inbounds [6 x i8], [6 x i8]* %vis, i64 0, i64 0
  br label %3

.thread54.preheader:                              ; preds = %.thread107
  %2 = getelementptr inbounds [6 x i8], [6 x i8]* %vis5, i64 0, i64 0
  br label %18

; <label>:3                                       ; preds = %0, %.thread107
  %indvars.iv102 = phi i64 [ 0, %0 ], [ %indvars.iv.next103, %.thread107 ]
  call void @llvm.lifetime.start(i64 6, i8* %1) #7
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 6, i32 1, i1 false)
  %4 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv102, i64 0
  %5 = load i8, i8* %4, align 1, !tbaa !1
  %6 = zext i8 %5 to i64
  %7 = getelementptr inbounds [6 x i8], [6 x i8]* %vis, i64 0, i64 %6
  %8 = load i8, i8* %7, align 1, !tbaa !4, !range !6
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %3
  store i8 1, i8* %7, align 1, !tbaa !4
  %11 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv102, i64 1
  %12 = load i8, i8* %11, align 1, !tbaa !1
  %13 = zext i8 %12 to i64
  %14 = getelementptr inbounds [6 x i8], [6 x i8]* %vis, i64 0, i64 %13
  %15 = load i8, i8* %14, align 1, !tbaa !4, !range !6
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %190, label %17

; <label>:17                                      ; preds = %204, %197, %190, %10, %3
  call void @llvm.lifetime.end(i64 6, i8* nonnull %1) #7
  br label %.thread73

; <label>:18                                      ; preds = %.thread54.preheader, %.thread60106
  %indvars.iv98 = phi i64 [ 0, %.thread54.preheader ], [ %indvars.iv.next99, %.thread60106 ]
  call void @llvm.lifetime.start(i64 6, i8* %2) #7
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 6, i32 1, i1 false)
  %19 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 0, i64 %indvars.iv98
  %20 = load i8, i8* %19, align 1, !tbaa !1
  %21 = zext i8 %20 to i64
  %22 = getelementptr inbounds [6 x i8], [6 x i8]* %vis5, i64 0, i64 %21
  %23 = load i8, i8* %22, align 1, !tbaa !4, !range !6
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %25, label %32

; <label>:25                                      ; preds = %18
  store i8 1, i8* %22, align 1, !tbaa !4
  %26 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 1, i64 %indvars.iv98
  %27 = load i8, i8* %26, align 1, !tbaa !1
  %28 = zext i8 %27 to i64
  %29 = getelementptr inbounds [6 x i8], [6 x i8]* %vis5, i64 0, i64 %28
  %30 = load i8, i8* %29, align 1, !tbaa !4, !range !6
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %168, label %32

; <label>:32                                      ; preds = %182, %175, %168, %25, %18
  call void @llvm.lifetime.end(i64 6, i8* nonnull %2) #7
  br label %.thread73

.preheader77:                                     ; preds = %.preheader77.preheader, %.thread64105
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %.thread64105 ], [ 0, %.preheader77.preheader ]
  %33 = getelementptr inbounds [5 x [4 x i8]], [5 x [4 x i8]]* @row, i64 0, i64 %indvars.iv94, i64 0
  %34 = load i8, i8* %33, align 4, !tbaa !1
  switch i8 %34, label %47 [
    i8 2, label %41
    i8 1, label %35
  ]

; <label>:35                                      ; preds = %.preheader77
  %36 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 0
  %37 = load i8, i8* %36, align 1, !tbaa !1
  %38 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 1
  %39 = load i8, i8* %38, align 1, !tbaa !1
  %40 = icmp ult i8 %37, %39
  br i1 %40, label %.thread73.loopexit110, label %47

; <label>:41                                      ; preds = %.preheader77
  %42 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 0
  %43 = load i8, i8* %42, align 1, !tbaa !1
  %44 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 1
  %45 = load i8, i8* %44, align 1, !tbaa !1
  %46 = icmp ugt i8 %43, %45
  br i1 %46, label %.thread73.loopexit110, label %47

; <label>:47                                      ; preds = %.preheader77, %41, %35
  %48 = getelementptr inbounds [5 x [4 x i8]], [5 x [4 x i8]]* @row, i64 0, i64 %indvars.iv94, i64 1
  %49 = load i8, i8* %48, align 1, !tbaa !1
  switch i8 %49, label %137 [
    i8 2, label %131
    i8 1, label %125
  ]

.preheader:                                       ; preds = %.preheader.preheader, %.thread71104
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %.thread71104 ], [ 0, %.preheader.preheader ]
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %50 = getelementptr inbounds [4 x [5 x i8]], [4 x [5 x i8]]* @col, i64 0, i64 %indvars.iv90, i64 0
  %51 = load i8, i8* %50, align 1, !tbaa !1
  switch i8 %51, label %64 [
    i8 2, label %58
    i8 1, label %52
  ]

; <label>:52                                      ; preds = %.preheader
  %53 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv90, i64 0
  %54 = load i8, i8* %53, align 1, !tbaa !1
  %55 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv.next91, i64 0
  %56 = load i8, i8* %55, align 1, !tbaa !1
  %57 = icmp ugt i8 %54, %56
  br i1 %57, label %.thread73.loopexit, label %64

; <label>:58                                      ; preds = %.preheader
  %59 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv90, i64 0
  %60 = load i8, i8* %59, align 1, !tbaa !1
  %61 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv.next91, i64 0
  %62 = load i8, i8* %61, align 1, !tbaa !1
  %63 = icmp ult i8 %60, %62
  br i1 %63, label %.thread73.loopexit, label %64

; <label>:64                                      ; preds = %.preheader, %58, %52
  %65 = getelementptr inbounds [4 x [5 x i8]], [4 x [5 x i8]]* @col, i64 0, i64 %indvars.iv90, i64 1
  %66 = load i8, i8* %65, align 1, !tbaa !1
  switch i8 %66, label %79 [
    i8 2, label %73
    i8 1, label %67
  ]

.thread73.loopexit:                               ; preds = %118, %112, %103, %97, %88, %82, %73, %67, %52, %58, %.thread71104
  %.1349.ph = phi i1 [ true, %.thread71104 ], [ false, %58 ], [ false, %52 ], [ false, %67 ], [ false, %73 ], [ false, %82 ], [ false, %88 ], [ false, %97 ], [ false, %103 ], [ false, %112 ], [ false, %118 ]
  br label %.thread73

.thread73.loopexit110:                            ; preds = %161, %155, %146, %140, %131, %125, %41, %35
  br label %.thread73

.thread73:                                        ; preds = %.thread73.loopexit110, %.thread73.loopexit, %32, %17
  %.1349 = phi i1 [ false, %17 ], [ false, %32 ], [ %.1349.ph, %.thread73.loopexit ], [ false, %.thread73.loopexit110 ]
  ret i1 %.1349

; <label>:67                                      ; preds = %64
  %68 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv90, i64 1
  %69 = load i8, i8* %68, align 1, !tbaa !1
  %70 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv.next91, i64 1
  %71 = load i8, i8* %70, align 1, !tbaa !1
  %72 = icmp ugt i8 %69, %71
  br i1 %72, label %.thread73.loopexit, label %79

; <label>:73                                      ; preds = %64
  %74 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv90, i64 1
  %75 = load i8, i8* %74, align 1, !tbaa !1
  %76 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv.next91, i64 1
  %77 = load i8, i8* %76, align 1, !tbaa !1
  %78 = icmp ult i8 %75, %77
  br i1 %78, label %.thread73.loopexit, label %79

; <label>:79                                      ; preds = %73, %67, %64
  %80 = getelementptr inbounds [4 x [5 x i8]], [4 x [5 x i8]]* @col, i64 0, i64 %indvars.iv90, i64 2
  %81 = load i8, i8* %80, align 1, !tbaa !1
  switch i8 %81, label %94 [
    i8 2, label %88
    i8 1, label %82
  ]

; <label>:82                                      ; preds = %79
  %83 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv90, i64 2
  %84 = load i8, i8* %83, align 1, !tbaa !1
  %85 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv.next91, i64 2
  %86 = load i8, i8* %85, align 1, !tbaa !1
  %87 = icmp ugt i8 %84, %86
  br i1 %87, label %.thread73.loopexit, label %94

; <label>:88                                      ; preds = %79
  %89 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv90, i64 2
  %90 = load i8, i8* %89, align 1, !tbaa !1
  %91 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv.next91, i64 2
  %92 = load i8, i8* %91, align 1, !tbaa !1
  %93 = icmp ult i8 %90, %92
  br i1 %93, label %.thread73.loopexit, label %94

; <label>:94                                      ; preds = %88, %82, %79
  %95 = getelementptr inbounds [4 x [5 x i8]], [4 x [5 x i8]]* @col, i64 0, i64 %indvars.iv90, i64 3
  %96 = load i8, i8* %95, align 1, !tbaa !1
  switch i8 %96, label %109 [
    i8 2, label %103
    i8 1, label %97
  ]

; <label>:97                                      ; preds = %94
  %98 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv90, i64 3
  %99 = load i8, i8* %98, align 1, !tbaa !1
  %100 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv.next91, i64 3
  %101 = load i8, i8* %100, align 1, !tbaa !1
  %102 = icmp ugt i8 %99, %101
  br i1 %102, label %.thread73.loopexit, label %109

; <label>:103                                     ; preds = %94
  %104 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv90, i64 3
  %105 = load i8, i8* %104, align 1, !tbaa !1
  %106 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv.next91, i64 3
  %107 = load i8, i8* %106, align 1, !tbaa !1
  %108 = icmp ult i8 %105, %107
  br i1 %108, label %.thread73.loopexit, label %109

; <label>:109                                     ; preds = %103, %97, %94
  %110 = getelementptr inbounds [4 x [5 x i8]], [4 x [5 x i8]]* @col, i64 0, i64 %indvars.iv90, i64 4
  %111 = load i8, i8* %110, align 1, !tbaa !1
  switch i8 %111, label %.thread71104 [
    i8 2, label %118
    i8 1, label %112
  ]

; <label>:112                                     ; preds = %109
  %113 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv90, i64 4
  %114 = load i8, i8* %113, align 1, !tbaa !1
  %115 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv.next91, i64 4
  %116 = load i8, i8* %115, align 1, !tbaa !1
  %117 = icmp ugt i8 %114, %116
  br i1 %117, label %.thread73.loopexit, label %.thread71104

; <label>:118                                     ; preds = %109
  %119 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv90, i64 4
  %120 = load i8, i8* %119, align 1, !tbaa !1
  %121 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv.next91, i64 4
  %122 = load i8, i8* %121, align 1, !tbaa !1
  %123 = icmp ult i8 %120, %122
  br i1 %123, label %.thread73.loopexit, label %.thread71104

.thread71104:                                     ; preds = %118, %112, %109
  %124 = icmp slt i64 %indvars.iv.next91, 4
  br i1 %124, label %.preheader, label %.thread73.loopexit

; <label>:125                                     ; preds = %47
  %126 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 1
  %127 = load i8, i8* %126, align 1, !tbaa !1
  %128 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 2
  %129 = load i8, i8* %128, align 1, !tbaa !1
  %130 = icmp ult i8 %127, %129
  br i1 %130, label %.thread73.loopexit110, label %137

; <label>:131                                     ; preds = %47
  %132 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 1
  %133 = load i8, i8* %132, align 1, !tbaa !1
  %134 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 2
  %135 = load i8, i8* %134, align 1, !tbaa !1
  %136 = icmp ugt i8 %133, %135
  br i1 %136, label %.thread73.loopexit110, label %137

; <label>:137                                     ; preds = %131, %125, %47
  %138 = getelementptr inbounds [5 x [4 x i8]], [5 x [4 x i8]]* @row, i64 0, i64 %indvars.iv94, i64 2
  %139 = load i8, i8* %138, align 2, !tbaa !1
  switch i8 %139, label %152 [
    i8 2, label %146
    i8 1, label %140
  ]

; <label>:140                                     ; preds = %137
  %141 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 2
  %142 = load i8, i8* %141, align 1, !tbaa !1
  %143 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 3
  %144 = load i8, i8* %143, align 1, !tbaa !1
  %145 = icmp ult i8 %142, %144
  br i1 %145, label %.thread73.loopexit110, label %152

; <label>:146                                     ; preds = %137
  %147 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 2
  %148 = load i8, i8* %147, align 1, !tbaa !1
  %149 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 3
  %150 = load i8, i8* %149, align 1, !tbaa !1
  %151 = icmp ugt i8 %148, %150
  br i1 %151, label %.thread73.loopexit110, label %152

; <label>:152                                     ; preds = %146, %140, %137
  %153 = getelementptr inbounds [5 x [4 x i8]], [5 x [4 x i8]]* @row, i64 0, i64 %indvars.iv94, i64 3
  %154 = load i8, i8* %153, align 1, !tbaa !1
  switch i8 %154, label %.thread64105 [
    i8 2, label %161
    i8 1, label %155
  ]

; <label>:155                                     ; preds = %152
  %156 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 3
  %157 = load i8, i8* %156, align 1, !tbaa !1
  %158 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 4
  %159 = load i8, i8* %158, align 1, !tbaa !1
  %160 = icmp ult i8 %157, %159
  br i1 %160, label %.thread73.loopexit110, label %.thread64105

; <label>:161                                     ; preds = %152
  %162 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 3
  %163 = load i8, i8* %162, align 1, !tbaa !1
  %164 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv94, i64 4
  %165 = load i8, i8* %164, align 1, !tbaa !1
  %166 = icmp ugt i8 %163, %165
  br i1 %166, label %.thread73.loopexit110, label %.thread64105

.thread64105:                                     ; preds = %161, %155, %152
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %167 = icmp slt i64 %indvars.iv.next95, 5
  br i1 %167, label %.preheader77, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.thread64105
  br label %.preheader

; <label>:168                                     ; preds = %25
  store i8 1, i8* %29, align 1, !tbaa !4
  %169 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 2, i64 %indvars.iv98
  %170 = load i8, i8* %169, align 1, !tbaa !1
  %171 = zext i8 %170 to i64
  %172 = getelementptr inbounds [6 x i8], [6 x i8]* %vis5, i64 0, i64 %171
  %173 = load i8, i8* %172, align 1, !tbaa !4, !range !6
  %174 = icmp eq i8 %173, 0
  br i1 %174, label %175, label %32

; <label>:175                                     ; preds = %168
  store i8 1, i8* %172, align 1, !tbaa !4
  %176 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 3, i64 %indvars.iv98
  %177 = load i8, i8* %176, align 1, !tbaa !1
  %178 = zext i8 %177 to i64
  %179 = getelementptr inbounds [6 x i8], [6 x i8]* %vis5, i64 0, i64 %178
  %180 = load i8, i8* %179, align 1, !tbaa !4, !range !6
  %181 = icmp eq i8 %180, 0
  br i1 %181, label %182, label %32

; <label>:182                                     ; preds = %175
  store i8 1, i8* %179, align 1, !tbaa !4
  %183 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 4, i64 %indvars.iv98
  %184 = load i8, i8* %183, align 1, !tbaa !1
  %185 = zext i8 %184 to i64
  %186 = getelementptr inbounds [6 x i8], [6 x i8]* %vis5, i64 0, i64 %185
  %187 = load i8, i8* %186, align 1, !tbaa !4, !range !6
  %188 = icmp eq i8 %187, 0
  br i1 %188, label %.thread60106, label %32

.thread60106:                                     ; preds = %182
  call void @llvm.lifetime.end(i64 6, i8* nonnull %2) #7
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %189 = icmp slt i64 %indvars.iv.next99, 5
  br i1 %189, label %18, label %.preheader77.preheader

.preheader77.preheader:                           ; preds = %.thread60106
  br label %.preheader77

; <label>:190                                     ; preds = %10
  store i8 1, i8* %14, align 1, !tbaa !4
  %191 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv102, i64 2
  %192 = load i8, i8* %191, align 1, !tbaa !1
  %193 = zext i8 %192 to i64
  %194 = getelementptr inbounds [6 x i8], [6 x i8]* %vis, i64 0, i64 %193
  %195 = load i8, i8* %194, align 1, !tbaa !4, !range !6
  %196 = icmp eq i8 %195, 0
  br i1 %196, label %197, label %17

; <label>:197                                     ; preds = %190
  store i8 1, i8* %194, align 1, !tbaa !4
  %198 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv102, i64 3
  %199 = load i8, i8* %198, align 1, !tbaa !1
  %200 = zext i8 %199 to i64
  %201 = getelementptr inbounds [6 x i8], [6 x i8]* %vis, i64 0, i64 %200
  %202 = load i8, i8* %201, align 1, !tbaa !4, !range !6
  %203 = icmp eq i8 %202, 0
  br i1 %203, label %204, label %17

; <label>:204                                     ; preds = %197
  store i8 1, i8* %201, align 1, !tbaa !4
  %205 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv102, i64 4
  %206 = load i8, i8* %205, align 1, !tbaa !1
  %207 = zext i8 %206 to i64
  %208 = getelementptr inbounds [6 x i8], [6 x i8]* %vis, i64 0, i64 %207
  %209 = load i8, i8* %208, align 1, !tbaa !4, !range !6
  %210 = icmp eq i8 %209, 0
  br i1 %210, label %.thread107, label %17

.thread107:                                       ; preds = %204
  call void @llvm.lifetime.end(i64 6, i8* nonnull %1) #7
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %211 = icmp slt i64 %indvars.iv.next103, 5
  br i1 %211, label %3, label %.thread54.preheader
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind uwtable
define zeroext i1 @fill_number(i8* nocapture readonly %input) #2 {
  br label %.preheader

.preheader:                                       ; preds = %0, %36
  %indvars.iv11 = phi i64 [ 0, %0 ], [ %indvars.iv.next12, %36 ]
  %1 = mul nuw nsw i64 %indvars.iv11, 5
  %2 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv11, i64 0
  %3 = load i8, i8* %2, align 1, !tbaa !1
  %4 = icmp eq i8 %3, 0
  %.phi.trans.insert = getelementptr inbounds i8, i8* %input, i64 %1
  %.pre = load i8, i8* %.phi.trans.insert, align 1, !tbaa !1
  br i1 %4, label %.thread, label %5

; <label>:5                                       ; preds = %.preheader
  %6 = icmp eq i8 %.pre, 48
  br i1 %6, label %8, label %.loopexit

.thread:                                          ; preds = %.preheader
  %7 = add i8 %.pre, -48
  store i8 %7, i8* %2, align 1, !tbaa !1
  br label %8

; <label>:8                                       ; preds = %5, %.thread
  %9 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv11, i64 1
  %10 = load i8, i8* %9, align 1, !tbaa !1
  %11 = icmp eq i8 %10, 0
  %.pre17 = add nuw nsw i64 %1, 1
  %.phi.trans.insert18 = getelementptr inbounds i8, i8* %input, i64 %.pre17
  %.pre19 = load i8, i8* %.phi.trans.insert18, align 1, !tbaa !1
  br i1 %11, label %.thread.1, label %12

.loopexit:                                        ; preds = %36, %5, %12, %19, %26, %33
  %.1 = phi i1 [ false, %33 ], [ false, %26 ], [ false, %19 ], [ false, %12 ], [ false, %5 ], [ true, %36 ]
  ret i1 %.1

; <label>:12                                      ; preds = %8
  %13 = icmp eq i8 %.pre19, 48
  br i1 %13, label %15, label %.loopexit

.thread.1:                                        ; preds = %8
  %14 = add i8 %.pre19, -48
  store i8 %14, i8* %9, align 1, !tbaa !1
  br label %15

; <label>:15                                      ; preds = %12, %.thread.1
  %16 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv11, i64 2
  %17 = load i8, i8* %16, align 1, !tbaa !1
  %18 = icmp eq i8 %17, 0
  %.pre20 = add nuw nsw i64 %1, 2
  %.phi.trans.insert22 = getelementptr inbounds i8, i8* %input, i64 %.pre20
  %.pre23 = load i8, i8* %.phi.trans.insert22, align 1, !tbaa !1
  br i1 %18, label %.thread.2, label %19

; <label>:19                                      ; preds = %15
  %20 = icmp eq i8 %.pre23, 48
  br i1 %20, label %22, label %.loopexit

.thread.2:                                        ; preds = %15
  %21 = add i8 %.pre23, -48
  store i8 %21, i8* %16, align 1, !tbaa !1
  br label %22

; <label>:22                                      ; preds = %19, %.thread.2
  %23 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv11, i64 3
  %24 = load i8, i8* %23, align 1, !tbaa !1
  %25 = icmp eq i8 %24, 0
  %.pre24 = add nuw nsw i64 %1, 3
  %.phi.trans.insert26 = getelementptr inbounds i8, i8* %input, i64 %.pre24
  %.pre27 = load i8, i8* %.phi.trans.insert26, align 1, !tbaa !1
  br i1 %25, label %.thread.3, label %26

; <label>:26                                      ; preds = %22
  %27 = icmp eq i8 %.pre27, 48
  br i1 %27, label %29, label %.loopexit

.thread.3:                                        ; preds = %22
  %28 = add i8 %.pre27, -48
  store i8 %28, i8* %23, align 1, !tbaa !1
  br label %29

; <label>:29                                      ; preds = %26, %.thread.3
  %30 = getelementptr inbounds [5 x [5 x i8]], [5 x [5 x i8]]* @map, i64 0, i64 %indvars.iv11, i64 4
  %31 = load i8, i8* %30, align 1, !tbaa !1
  %32 = icmp eq i8 %31, 0
  %.pre28 = add nuw nsw i64 %1, 4
  %.phi.trans.insert30 = getelementptr inbounds i8, i8* %input, i64 %.pre28
  %.pre31 = load i8, i8* %.phi.trans.insert30, align 1, !tbaa !1
  br i1 %32, label %.thread.4, label %33

; <label>:33                                      ; preds = %29
  %34 = icmp eq i8 %.pre31, 48
  br i1 %34, label %36, label %.loopexit

.thread.4:                                        ; preds = %29
  %35 = add i8 %.pre31, -48
  store i8 %35, i8* %30, align 1, !tbaa !1
  br label %36

; <label>:36                                      ; preds = %33, %.thread.4
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %37 = icmp slt i64 %indvars.iv.next12, 5
  br i1 %37, label %.preheader, label %.loopexit
}

; Function Attrs: nounwind readonly uwtable
define zeroext i1 @valid(i8* nocapture readonly %input) #3 {
  %strlenfirst = load i8, i8* %input, align 1
  %1 = icmp eq i8 %strlenfirst, 0
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %0
  %.off5 = add i8 %strlenfirst, -48
  %2 = icmp ugt i8 %.off5, 5
  br i1 %2, label %._crit_edge, label %.lr.ph7.preheader

.lr.ph7.preheader:                                ; preds = %.lr.ph.preheader
  %3 = tail call i64 @strlen(i8* nonnull %input) #8
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %..lr.ph_crit_edge
  %indvars.iv.next6 = phi i64 [ %indvars.iv.next, %..lr.ph_crit_edge ], [ 1, %.lr.ph7.preheader ]
  %4 = icmp ult i64 %indvars.iv.next6, %3
  br i1 %4, label %..lr.ph_crit_edge, label %._crit_edge.loopexit

..lr.ph_crit_edge:                                ; preds = %.lr.ph7
  %.phi.trans.insert = getelementptr inbounds i8, i8* %input, i64 %indvars.iv.next6
  %.pre = load i8, i8* %.phi.trans.insert, align 1, !tbaa !1
  %.off = add i8 %.pre, -48
  %5 = icmp ugt i8 %.off, 5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv.next6, 1
  br i1 %5, label %._crit_edge.loopexit, label %.lr.ph7

._crit_edge.loopexit:                             ; preds = %..lr.ph_crit_edge, %.lr.ph7
  %.ph = phi i1 [ false, %..lr.ph_crit_edge ], [ true, %.lr.ph7 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.preheader, %0
  %6 = phi i1 [ true, %0 ], [ false, %.lr.ph.preheader ], [ %.ph, %._crit_edge.loopexit ]
  ret i1 %6
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #4

; Function Attrs: nounwind uwtable
define i32 @main() #5 {
  %1 = tail call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([100 x i8], [100 x i8]* @input, i64 0, i64 0))
  %2 = tail call i64 @strlen(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @input, i64 0, i64 0)) #8
  %3 = trunc i64 %2 to i32
  %4 = icmp eq i32 %3, 25
  br i1 %4, label %5, label %valid.exit

; <label>:5                                       ; preds = %0
  %strlenfirst.i = load i8, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @input, i64 0, i64 0), align 16
  %6 = icmp eq i8 %strlenfirst.i, 0
  br i1 %6, label %.loopexit, label %.lr.ph.i.preheader

.lr.ph.i.preheader:                               ; preds = %5
  %.off.i1 = add i8 %strlenfirst.i, -48
  %7 = icmp ugt i8 %.off.i1, 5
  br i1 %7, label %valid.exit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.i.preheader
  %8 = tail call i64 @strlen(i8* nonnull getelementptr inbounds ([100 x i8], [100 x i8]* @input, i64 0, i64 0)) #8
  br label %9

; <label>:9                                       ; preds = %.lr.ph, %..lr.ph_crit_edge.i
  %indvars.iv.next.i2 = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next.i, %..lr.ph_crit_edge.i ]
  %10 = icmp ult i64 %indvars.iv.next.i2, %8
  br i1 %10, label %..lr.ph_crit_edge.i, label %.loopexit.loopexit

..lr.ph_crit_edge.i:                              ; preds = %9
  %.phi.trans.insert.i = getelementptr inbounds [100 x i8], [100 x i8]* @input, i64 0, i64 %indvars.iv.next.i2
  %.pre.i = load i8, i8* %.phi.trans.insert.i, align 1, !tbaa !1
  %.off.i = add i8 %.pre.i, -48
  %11 = icmp ugt i8 %.off.i, 5
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.next.i2, 1
  br i1 %11, label %valid.exit.loopexit, label %9

.loopexit.loopexit:                               ; preds = %9
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %5
  %12 = tail call zeroext i1 @fill_number(i8* nonnull getelementptr inbounds ([100 x i8], [100 x i8]* @input, i64 0, i64 0))
  br i1 %12, label %13, label %valid.exit

; <label>:13                                      ; preds = %.loopexit
  %14 = tail call zeroext i1 @docheck() #7
  br i1 %14, label %15, label %valid.exit

; <label>:15                                      ; preds = %13
  %16 = tail call i32 (i8*, ...) @printf(i8* nonnull getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8* nonnull getelementptr inbounds ([100 x i8], [100 x i8]* @input, i64 0, i64 0))
  br label %valid.exit

valid.exit.loopexit:                              ; preds = %..lr.ph_crit_edge.i
  br label %valid.exit

valid.exit:                                       ; preds = %valid.exit.loopexit, %.lr.ph.i.preheader, %13, %15, %.loopexit, %0
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @__isoc99_scanf(i8* nocapture readonly, ...) #6

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #6

attributes #0 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"_Bool", !2, i64 0}
!6 = !{i8 0, i8 2}
