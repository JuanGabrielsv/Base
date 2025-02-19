export interface Serie {
  name: string;
  language: string;
  genres: string[];
  image: Imagen;
  summary: string;
}

export interface Imagen {
  original: string;
}
