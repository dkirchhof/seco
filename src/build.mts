import { watch } from "fs";
import { readdir } from "fs/promises";
import { basename, resolve, dirname, parse } from "path";

export const build = async (src: string, dist: string) => {
  // console.log(dir, pages)
  await buildPages(src, dist);

  // const watcher = watch(dir, { recursive: true }, async (_event, filename) => {
  //   // console.log(_event, filename)

  //   if (filename && filename.endsWith(".mjs") || filename?.endsWith(".css~")) {
  //     await buildPages(dir);
  //   }
  // });

  // process.on("SIGINT", () => {
  //   console.log("Closing watcher...");

  //   watcher.close();
  //   process.exit(0);
  // });
};

const buildPages = async (src: string, dist: string) => {
  const files = await readdir(src, { recursive: true });

  const pages = files.filter(file => file.endsWith("_Page.mjs"));
  // .map(file => `${dir}/${file}`);

  for (const page of pages) {
    const clientFiles: string[] = [];
    const styleFiles1: string[] = [];
    const styleFiles2: string[] = [];

    const file = resolve(src, page);

    await Bun.build({
      entrypoints: [file],
      plugins: [
        {
          name: "Siblings Extractor",
          setup(build) {
            build.onLoad({ filter: /\.mjs$/ }, async args => {
              const clientPath = args.path.slice(0, -4) + "_Client.mjs";

              if (await Bun.file(clientPath).exists()) {
                clientFiles.push(clientPath);
              }

              const stylePath = args.path.slice(0, -4) + ".css";

              if (await Bun.file(stylePath).exists()) {
                styleFiles2.push(stylePath);
              }

              return undefined;
            });
          },
        },
        {
          name: "CSS Imports Extractor",
          setup(build) {
            build.onLoad({ filter: /\.css$/ }, async args => {
              styleFiles1.push(args.path);

              return undefined;
            });
          },
        },
      ],
    });

    // const fileName = basename(page);

    console.log(`${page}:`);

    // console.log(clientFiles)
    // console.log(styleFiles1)
    // console.log(styleFiles2)

    const path = parse(page);
    const outdir = resolve(dist, path.dir);

    if (clientFiles.length > 0) {
      const tmpFile = `/tmp/${page}`;

      await Bun.write(tmpFile, clientFiles.map(f => `import "${f}"`).join('\n'));

      const result = await Bun.build({
        entrypoints: [tmpFile],
        outdir,
        minify: false,
      });

      if (result.success) {
        // console.log(result.outputs[0].path);
        console.log("client file ✓");
      } else {
        console.error("client file ❌");
      }
    } else {
      console.log("no js");
    }

    if (styleFiles1.length > 0 || styleFiles2.length > 0) {
      const stylePath = resolve(outdir, path.name) + ".css";

      const content = await Promise.all(
        [...styleFiles1, ...styleFiles2].map(file => Bun.file(file).text())
      );

      await Bun.write(stylePath, content.join("\n"));

      // console.log(stylePath)
      console.log("style file ✓");
    } else {
      console.log("no css");
    }

    console.log("")
  }
};
