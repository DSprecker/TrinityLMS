using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace TrinityLMS.DATA.EF.DbMetadata
{
    #region UserDetails Metadata

    public class UserDetailsMetadata
    {


        [Display(Name = "I.D.")]
        [Required(ErrorMessage = "*Required")]
        [StringLength(128, ErrorMessage = "*Value must be 128 characters or less")]
        public string UserId { get; set; }

        [Display(Name = "First Name")]
        [Required(ErrorMessage = "*Required")]
        [StringLength(50, ErrorMessage = "*Value must be 50 characters or less")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "*Required")]
        [StringLength(50, ErrorMessage = "*Value must be 50 characters or less")]
        public string LastName { get; set; }


    }
    #endregion


    #region LessonViewsMetadata
    public class LessonViewsMetadata
    {

        [Display(Name = "User I.D.")]
        [Required(ErrorMessage = "*Required")]
        [StringLength(128, ErrorMessage = "*Value must be 128 characters or less")]
        public string UserId { get; set; }

        [Display(Name = "Lesson I.D.")]
        [Required(ErrorMessage = "*Required")]
        public int LessonId { get; set; }

        [Display(Name = "Date Viewed")]
        [Required(ErrorMessage = "*Required")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public DateTime DateViewed { get; set; }
    }
    #endregion

    #region LessonsMetadata
    public class LessonsMetadata
    {
        [Display(Name = "Lesson")]
        [Required(ErrorMessage = "*Required")]
        [StringLength(200, ErrorMessage = "*Value must be 200 characters or less")]
        public string LessonTitle { get; set; }

        [Display(Name = "Course I.D.")]
        [Required(ErrorMessage = "*Required")]
        public int CourseId { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(200, ErrorMessage = "*Value must be 200 characters or less")]
        public string Introduction { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(200, ErrorMessage = "*Value must be 200 characters or less")]
        public string VideoURL { get; set; }

        [StringLength(200, ErrorMessage = "*Value must be 200 characters or less")]
        public string PdfFilename { get; set; }

        [Required(ErrorMessage = "*Required")]
        [Display(Name = "Active?")]
        public bool IsActive { get; set; }
    }


    #endregion

    #region CourseCompletionsMetadata
    public class CourseCompletionsMetadata
    {
        [Display(Name = "User I.D.")]
        [Required(ErrorMessage = "*Required")]
        [StringLength(128, ErrorMessage = "*Value must be 128 characters or less")]
        public string UserId { get; set; }

        [Display(Name = "Course I.D.")]
        [Required(ErrorMessage = "*Required")]
        public int CourseId { get; set; }

        [Display(Name = "Completion Date")]
        [Required(ErrorMessage = "*Required")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public DateTime DateCompleted { get; set; }
    }
    #endregion

    public class CoursesMetadata
    {
        [Display(Name = "Completion Date")]
        [Required(ErrorMessage = "*Required")]
        [StringLength(200, ErrorMessage = "Value must be 200 characters or less.")]
        public string CourseName { get; set; }

        [Display(Name = "Description")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [UIHint("MultilineText")]
        [StringLength(500, ErrorMessage = "Value must be 500 characters or less.")]
        public string CourseDescription { get; set; }


        [Display(Name = "Active?")]
        [Required(ErrorMessage = "*Required")]
        public bool IsActive { get; set; }

    }



}
